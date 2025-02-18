import 'package:flutter/material.dart';

class TextformWithTitle extends StatelessWidget {
  const TextformWithTitle({required this.title, required this.controller, this.keyboardType = TextInputType.number, super.key});

  final String title;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
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
            width: 150,
            height: 50,
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              )),
            ),
          )
        ],
      ),
    );
  }
}
