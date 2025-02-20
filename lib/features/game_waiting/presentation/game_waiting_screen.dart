import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typewrite_text/typewrite_text.dart';

import '../../../localization/l10n.dart';
import '../../../core/index.dart';
import '../index.dart';

const listDots = ['.....'];
const listCountdown = ['5', '4', '3', '2', '1', '0'];

class GameWaitingScreen extends StatefulWidget {
  const GameWaitingScreen({super.key});

  @override
  State<GameWaitingScreen> createState() => _GameWaitingScreenState();
}

class _GameWaitingScreenState extends State<GameWaitingScreen> {
  var countdown = 5;

  @override
  Widget build(BuildContext context) {
    final loc = context.l10n;
    final bloc = context.read<WaitingGameCubit>();
    final pannelSize = MediaQuery.sizeOf(context).width * 0.8;
    final buttonSize = pannelSize / 2 - 32;
    const headerStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black);
    const countdownStyle = TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: pannelSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.deepPurpleAccent.withValues(alpha: 0.1),
              ),
              padding: const EdgeInsets.all(16),
              child: BlocConsumer<WaitingGameCubit, WaitingGameState>(
                listener: (context, state) {
                  if (state.status == WaitingStatus.quit) {
                    const HomeRoute().go(context);
                  } else if (state.status == WaitingStatus.ready) {
                    GameRoute(state.id).go(context);
                  }
                },
                builder: (context, state) {
                  final headerWidget = state.status != WaitingStatus.waiting
                      ? const Text('', style: headerStyle)
                      : Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: buttonSize * 2 / 3), child: Text(loc.waiting, style: headerStyle)),
                            const TypewriteText(linesOfText: listDots, textStyle: headerStyle),
                          ],
                        );

                  final countdownWidget = state.status == WaitingStatus.timer || state.status == WaitingStatus.ready
                      ? TypewriteText(
                          linesOfText: listCountdown,
                          textStyle: countdownStyle,
                          forwardAnimationDuration: const Duration(milliseconds: 700),
                          beforeAnimationDuration: const Duration(milliseconds: 100),
                          afterAnimationDuration: const Duration(milliseconds: 100),
                          infiniteLoop: false,
                          tryToVibrate: VibrationType.medium,
                          callback: () {
                            if (--countdown <= 0) {
                              bloc.startGame();
                            }
                          },
                        )
                      : Text('${state.playersIn}/${state.count}', style: countdownStyle, textAlign: TextAlign.center);

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 16,
                    children: [
                      headerWidget,
                      countdownWidget,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppButton(child: Text(loc.start.toUpperCase()), width: buttonSize, onTap: bloc.launchCountdownTimer),
                          AppButton(child: Text(loc.quit.toUpperCase()), width: buttonSize, onTap: bloc.quitGame),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
