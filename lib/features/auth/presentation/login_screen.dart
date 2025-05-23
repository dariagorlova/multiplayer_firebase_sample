import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiplayer_firebase_sample/gen/colors.gen.dart';

import '../../../gen/assets.gen.dart';
import '../../../localization/l10n.dart';
import '../index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginScreen> {
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 0.7;
    final loc = context.l10n;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Assets.images.flutteristas.image(width: 200),
            ),
            Center(
              child: Container(
                width: width,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.black12),
                padding: const EdgeInsets.all(8),
                child: Row(
                  spacing: 16,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.white,
                          hintText: loc.enterName,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                      ),
                    ),
                    IntrinsicHeight(
                      child: ElevatedButton(
                        onPressed: () => context.read<AuthCubit>().setName(_nameController.text.trim()),
                        child: BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) => state.when(
                            loading: () => const SizedBox(width: 20, height: 20, child: CircularProgressIndicator()),
                            initial: () => const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: AppColors.purple,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
