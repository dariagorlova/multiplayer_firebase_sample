import 'package:flutter/widgets.dart';

import '../../../localization/l10n.dart';
import '../index.dart';

class GameExceptions implements LocalizedException {
  const GameExceptions(this.message);

  final String message;

  @override
  String toString() => message;

  @override
  String localized(BuildContext context) {
    final loc = context.l10n;
    final mapExceptions = {
      GameExceptionKeys.emptyGameName: loc.emptyGameName,
      GameExceptionKeys.tooLongGameName: loc.tooLongGameName,
      GameExceptionKeys.playerCountError: loc.playerCountError,
      GameExceptionKeys.gameDurationError: loc.gameDurationError,
      GameExceptionKeys.selectGameToJoin: loc.selectGameToJoin,
      GameExceptionKeys.invalidGameId: loc.invalidGameId,
      GameExceptionKeys.youCantStartGame: loc.youCantStartGame,
      GameExceptionKeys.wordDoesNotStartFromLastLetter: loc.wordDoesNotStartFromLastLetter,
      GameExceptionKeys.wordDoesNotNoun: loc.wordDoesNotNoun,
      GameExceptionKeys.wordIsName: loc.wordIsName,
      GameExceptionKeys.notYourTurn: loc.notYourTurn,
      GameExceptionKeys.wordAlreadyExists: loc.wordAlreadyExists,
      GameExceptionKeys.unknownError: loc.unknownError,
    };

    return mapExceptions[message] ?? message;
  }
}
