import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuitConfirmationDialog extends StatelessWidget {
  final String content;
  final String title;
  final String noButtonText;
  final String yesButtonText;

  const QuitConfirmationDialog({super.key, required this.title, required this.noButtonText, required this.yesButtonText, required this.content});

  @override
  Widget build(BuildContext context) {
    if (!Platform.isIOS) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () => context.pop(false),
            child: Text(noButtonText),
          ),
          TextButton(
            onPressed: () => context.pop(true),
            child: Text(yesButtonText),
          ),
        ],
      );
    } else {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => context.pop(false),
            child: Text(noButtonText),
          ),
          CupertinoDialogAction(
            isDefaultAction: false,
            onPressed: () => context.pop(true),
            child: Text(yesButtonText),
          )
        ],
      );
    }
  }
}
