import 'package:flutter/material.dart';
import 'package:multiplayer_firebase_sample/core/index.dart';

import '../../auth/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () => sl<AuthCubit>().signOut(),
            child: const Text('home screen'),
          ),
        ),
      ),
    );
  }
}
