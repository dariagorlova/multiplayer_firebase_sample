import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';

class OneWord {
  final String word;
  final String senderName;
  final bool iAmSender;

  OneWord({
    required this.word,
    required this.senderName,
    required this.iAmSender,
  });
}

class GameScreen extends StatefulWidget {
  const GameScreen({required this.gameName, super.key});

  final String gameName;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late List<OneWord> words;

  @override
  void initState() {
    super.initState();

    // from db or cubit or somewhere
    words = [
      OneWord(word: 'cat', senderName: 'me', iAmSender: true),
      OneWord(word: 'toy', senderName: 'anna', iAmSender: false),
      OneWord(word: 'yo-yo', senderName: 'sofia', iAmSender: false),
      OneWord(word: 'octopus', senderName: 'me', iAmSender: true),
      OneWord(word: 'sun', senderName: 'anna', iAmSender: false),
      OneWord(word: 'nose', senderName: 'sofia', iAmSender: false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game "${widget.gameName}"'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Padding(
              padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Turn: player1', style: const TextStyle(fontSize: 16, color: Colors.deepPurple, fontWeight: FontWeight.bold)),
                  // this text need a separate widget with timer
                  Text('Time left: 05:08', style: const TextStyle(fontSize: 16, color: Colors.deepPurple, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                    children: words
                        .map((word) => BubbleWithWord(
                              text: word.word,
                              isSender: word.iAmSender,
                            ))
                        .toList()),
              ),
            ),
            MessageBar(
              onSend: (word) {
                // !! validation
                setState(() {
                  words.add(OneWord(iAmSender: true, word: word, senderName: 'me'));
                });
              },
              messageBarHintText: 'Type your word here...',
              sendButtonColor: Colors.deepPurpleAccent,
            ),
          ],
        ),
      )),
    );
  }
}

class BubbleWithWord extends StatelessWidget {
  const BubbleWithWord({required this.text, required this.isSender, super.key});

  final String text;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    final bgColor = isSender ? Colors.deepPurpleAccent.withValues(alpha: 0.1) : const Color(0xFFE8E8EE);
    return BubbleSpecialThree(
      text: text,
      isSender: isSender,
      color: bgColor,
      tail: true,
    );
  }
}
