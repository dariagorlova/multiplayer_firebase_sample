import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../gen/colors.gen.dart';
import '../../index.dart';

class CountdownText extends StatefulWidget {
  const CountdownText({super.key});

  @override
  State<CountdownText> createState() => _CountdownTextState();
}

class _CountdownTextState extends State<CountdownText> {
  @override
  Widget build(BuildContext context) {
    const timerTextStyle = TextStyle(fontSize: 30, color: AppColors.purple, fontWeight: FontWeight.bold);
    final bloc = context.read<CountdownCubit>();

    return BlocConsumer<CountdownCubit, CountdownState>(
      listener: (context, state) {
        if (state.status == CountdownStatus.done) {
          context.read<GameCubit>().forceChangePlayer();
        }
      },
      builder: (context, state) {
        if (state.status == CountdownStatus.stop) {
          return const CircularProgressIndicator.adaptive();
        }
        return Text(bloc.asTimeString, style: timerTextStyle);
      },
    );
  }
}
