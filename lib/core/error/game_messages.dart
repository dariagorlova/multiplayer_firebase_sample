import 'package:flutter/widgets.dart';

import '../../../localization/l10n.dart';
import '../index.dart';

class GameMessages implements LocalizedMessage {
  const GameMessages(this.message);

  final String message;

  @override
  String toString() => message;

  @override
  String localized(BuildContext context) {
    final loc = context.l10n;
    final mapMessages = {
      GameMessageKeys.cantQuitNow: loc.cantQuitNow,
      GameMessageKeys.weAreAlmostIn: loc.weAreAlmostIn,
      GameMessageKeys.needMorePlayers: loc.needMorePlayers,
    };

    return mapMessages[message] ?? loc.unknownError;
  }
}
