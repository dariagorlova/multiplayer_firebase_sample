import 'dart:math';

import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../localization/l10n.dart';

class OfflineScreen extends StatelessWidget {
  const OfflineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final loc = context.l10n;

    return Scaffold(
      body: Center(
        child: Container(
          width: min(320, width * 0.7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.black12,
          ),
          padding: const EdgeInsets.all(8),
          child: Row(
            spacing: 24,
            children: [
              Assets.svg.offline.svg(width: min(90, width * 0.2)),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(
                    loc.offlineCaption,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(loc.offline1),
                  Text(loc.offline2),
                  Text(loc.offline3),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
