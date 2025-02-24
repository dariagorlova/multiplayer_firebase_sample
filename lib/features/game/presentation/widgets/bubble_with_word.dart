import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';

import '../../../../gen/colors.gen.dart';

class BubbleWithWord extends StatelessWidget {
  const BubbleWithWord({required this.text, required this.isSender, super.key});

  final String text;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    final bgColor = isSender ? AppColors.purple.withValues(alpha: 0.1) : AppColors.grey;
    return BubbleSpecialThree(
      text: text,
      isSender: isSender,
      color: bgColor,
      tail: true,
    );
  }
}
