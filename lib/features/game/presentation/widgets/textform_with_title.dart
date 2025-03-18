import 'dart:math';

import 'package:flutter/material.dart';
import 'package:multiplayer_firebase_sample/gen/colors.gen.dart';

class TextformWithTitle extends StatelessWidget {
  const TextformWithTitle({required this.title, required this.controller, this.keyboardType = TextInputType.number, super.key});

  final String title;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.deepPurple, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: min(150, screenSize.width * 0.4),
            height: min(50, screenSize.height * 0.1),
            child: Center(
              child: TextFormField(
                controller: controller,
                keyboardType: keyboardType,
                decoration: InputDecoration(
                    fillColor: AppColors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
