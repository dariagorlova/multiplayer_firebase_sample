import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiplayer_firebase_sample/features/game_join/index.dart';

import '../../../core/index.dart';
import '../../../localization/l10n.dart';

class JoinGameScreen extends StatefulWidget {
  const JoinGameScreen({super.key});

  @override
  State<JoinGameScreen> createState() => _JoinGameScreenState();
}

class _JoinGameScreenState extends State<JoinGameScreen> {
  @override
  Widget build(BuildContext context) {
    final loc = context.l10n;
    final bloc = context.read<JoinGameCubit>();

    return Scaffold(
        appBar: AppBar(title: Text(loc.joinGame)),
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.deepPurpleAccent.withValues(alpha: 0.1),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: BlocBuilder<JoinGameCubit, JoinGameState>(
                        builder: (context, state) {
                          return ListView(
                            children: state.activeGames
                                .map((game) => GestureDetector(
                                      onTap: () => bloc.selectGame(game),
                                      child: ListTile(
                                        tileColor: game == state.selectedGame ? Colors.deepPurpleAccent.withValues(alpha: 0.2) : Colors.transparent,
                                        title: Text(
                                          '${game.ownerName}\'s ${game.gameName}',
                                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                        ),
                                        trailing: Text(
                                          '${game.playersIn.length}/${game.playersCount}',
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                AppButton(
                  child: BlocConsumer<JoinGameCubit, JoinGameState>(
                    listener: (context, state) {
                      if (state.status == JoinGameStatus.success && state.selectedGame != null) {
                        WaitingGameRoute(state.selectedGame!.id!).go(context);
                      }
                    },
                    builder: (context, state) {
                      return state.status == JoinGameStatus.loading
                          ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator())
                          : Text(loc.joinGame.toUpperCase());
                    },
                  ),
                  onTap: bloc.joinGame,
                ),
              ],
            ),
          ),
        ));
  }
}
