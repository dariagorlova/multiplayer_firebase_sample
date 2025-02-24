import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typewrite_text/typewrite_text.dart';

import '../../../core/index.dart';
import '../../../gen/colors.gen.dart';
import '../../../localization/l10n.dart';
import '../index.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<GameCubit>();
    final loc = context.l10n;
    const timerTextStyle = TextStyle(fontSize: 30, color: AppColors.purple, fontWeight: FontWeight.bold);
    const playerTextStyle = TextStyle(fontSize: 14, color: AppColors.purple, fontWeight: FontWeight.bold);
    const errorIconSize = 14.0;
    const errorBoxSize = (errorIconSize * AppConst.maxErrors + (AppConst.maxErrors - 1) * 2);

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        leading: BackButton(onPressed: () => _quitAlert(bloc.quit)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocProvider(
            create: (context) => sl<CountdownCubit>(),
            child: BlocConsumer<GameCubit, GameState>(
              listener: (context, state) {
                final loc = context.l10n;
                final variants = {
                  GameStatus.win: GameOverRoute(result: loc.winner),
                  GameStatus.lose: GameOverRoute(result: loc.loser),
                }[state.status];
                variants?.go(context);
              },
              builder: (context, state) {
                if (state.status == GameStatus.initial) {
                  return const CircularProgressIndicator.adaptive();
                }
                final words = state.board.words;
                final firstChar = words.isEmpty ? loc.any : '\'${words.last.word[words.last.word.length - 1].toUpperCase()}\'';
                final countdownBloc = context.read<CountdownCubit>();
                if (countdownBloc.state.status == CountdownStatus.initial && state.board.duration > 0) {
                  countdownBloc.init(state.board.duration);
                }
                if (state.status == GameStatus.myTurn) {
                  countdownBloc.start();
                } else {
                  countdownBloc.stop();
                }

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: state.board.players
                                .map(
                                  (player) => Row(
                                    children: [
                                      SizedBox(
                                        width: errorBoxSize,
                                        child: Row(
                                          children: List<Widget>.generate(
                                            player.errorCount,
                                            (index) => const Icon(Icons.close, size: errorIconSize, color: AppColors.red),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        player.name == state.myName ? loc.me : player.name,
                                        style: playerTextStyle.copyWith(
                                          color: player.id == state.board.curPlayerId ? AppColors.green : AppColors.purple,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                          const CountdownText(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child:
                            Column(children: words.map((word) => BubbleWithWord(text: word.word, isSender: word.userName == state.myName)).toList()),
                      ),
                    ),
                    // the way to send word
                    const SizedBox(width: 150, child: Divider(color: AppColors.purple)),
                    MessageBar(
                      messageBarColor: Colors.transparent,
                      onSend: (word) {
                        context.read<CountdownCubit>().pause();
                        bloc.addWord(word.toLowerCase());
                      },
                      messageBarHintText: loc.hint(firstChar),
                      sendButtonColor: AppColors.purple,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _quitAlert(VoidCallback? quitAction) async {
    final res = await showDialog<bool>(
      context: context,
      builder: (context) {
        final loc = context.l10n;
        return QuitConfirmationDialog(
          title: loc.confirmation,
          noButtonText: loc.noBtn,
          yesButtonText: loc.yesBtn,
          content: loc.dialogContent,
        );
      },
    );
    if (res == true) {
      quitAction?.call();
    }
  }
}
