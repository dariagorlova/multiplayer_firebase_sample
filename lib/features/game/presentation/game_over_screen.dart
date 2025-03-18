import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../localization/l10n.dart';
import '../../../core/index.dart';

class GameOverScreen extends StatelessWidget {
  final bool result;
  const GameOverScreen({required this.result, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            result ? Assets.images.winner.image(height: 200) : Assets.images.looser.image(height: 200),
            const SizedBox(height: 16),
            AppButton(
              child: Text(context.l10n.backToHome.toUpperCase()),
              onTap: () => const HomeRoute().go(context),
            )
          ],
        ),
      ),
    );
  }
}
