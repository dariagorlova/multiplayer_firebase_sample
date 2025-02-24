import 'package:flutter/material.dart';

import '../../../localization/l10n.dart';
import '../../../core/index.dart';

class GameOverScreen extends StatelessWidget {
  final String result;
  const GameOverScreen({required this.result, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(result),
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
