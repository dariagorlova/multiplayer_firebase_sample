import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/index.dart';
import '../../../localization/l10n.dart';
import '../../game/presentation/widgets/textform_with_title.dart';
import '../index.dart';

class HostGameScreen extends StatefulWidget {
  const HostGameScreen({super.key});

  @override
  State<HostGameScreen> createState() => _HostGameScreenState();
}

class _HostGameScreenState extends State<HostGameScreen> {
  final _nameController = TextEditingController();
  final _playersController = TextEditingController();
  final _durationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = '';
    _playersController.text = AppConst.defaultPlayersCount;
    _durationController.text = AppConst.defaultGameDuration;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _playersController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = context.l10n;
    final bloc = context.read<HostGameCubit>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(loc.hostGame)),
      body: SafeArea(
        child: Center(
          child: Column(
            spacing: 16,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.deepPurpleAccent.withValues(alpha: 0.1),
                  ),
                  child: Column(
                    children: [
                      TextformWithTitle(title: loc.roomName, controller: _nameController, keyboardType: TextInputType.name),
                      TextformWithTitle(title: loc.playersAmount, controller: _playersController),
                      TextformWithTitle(title: loc.durationInSec, controller: _durationController)
                    ],
                  ),
                ),
              ),
              const Spacer(),
              AppButton(
                child: BlocConsumer<HostGameCubit, HostGameState>(
                  listener: (context, state) => state.maybeWhen(
                    success: (id) {
                      WaitingGameRoute(id).go(context);
                      return null;
                    },
                    orElse: () => null,
                  ),
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => const SizedBox(width: 20, height: 20, child: CircularProgressIndicator()),
                      orElse: () => Text(loc.hostGame.toUpperCase()),
                    );
                  },
                ),
                onTap: () => bloc.createGame(
                  gameName: _nameController.text.trim(),
                  playersCount: int.tryParse(_playersController.text.trim()) ?? 0,
                  gameDuration: int.tryParse(_durationController.text.trim()) ?? 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
