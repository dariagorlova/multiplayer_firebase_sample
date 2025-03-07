import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multiplayer_firebase_sample/core/index.dart';
import 'package:multiplayer_firebase_sample/localization/l10n.dart';

import '../../../gen/assets.gen.dart';
import '../../auth/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = context.l10n;
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton.icon(
            iconAlignment: IconAlignment.end,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
            icon: const Icon(Icons.logout),
            label: Text(loc.logout.toUpperCase()),
            onPressed: () => context.read<AuthCubit>().signOut(),
          )
        ],
      ),
      body: SafeArea(
        child: Stack(children: [
          Assets.images.flutteristas.image(width: 200),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                    child: Text(loc.joinGame.toUpperCase()),
                    onTap: () {
                      context.go(const JoinGameRoute().location);
                    }),
                const SizedBox(height: 16),
                AppButton(
                    child: Text(loc.hostGame.toUpperCase()),
                    onTap: () {
                      context.go(const HostGameRoute().location);
                    }),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
