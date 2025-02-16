import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({required this.child, required this.onTap, this.width = 200, super.key});
  final double width;
  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        child: child,
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.deepPurple,
          elevation: 6,
          backgroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
