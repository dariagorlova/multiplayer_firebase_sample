import 'package:flutter/widgets.dart';

import '../../../localization/l10n.dart';
import '../index.dart';

class FirebaseServicesException implements LocalizedException {
  const FirebaseServicesException(this.message);

  final String message;

  @override
  String toString() => message;

  @override
  String localized(BuildContext context) {
    final loc = context.l10n;
    final mapExceptions = {
      FirebaseExceptionKeys.operationNotAllowed: loc.operationNotAllowed,
      FirebaseExceptionKeys.nameIsAlreadyInUse: loc.nameIsAlreadyInUse,
      FirebaseExceptionKeys.reauthenticateBeforeDelete: loc.reauthenticateBeforeDelete,
      FirebaseExceptionKeys.nameCantBeEmpty: loc.nameCantBeEmpty,
      FirebaseExceptionKeys.requestTimeout: loc.requestTimeout,
      FirebaseExceptionKeys.permissionDenied: loc.permissionDenied,
      FirebaseExceptionKeys.rtdbCreateGameNode: loc.rtdbCreateGameNode,
      FirebaseExceptionKeys.rtdbAddUser: loc.rtdbAddUser,
      FirebaseExceptionKeys.rtdbDelUser: loc.rtdbDelUser,
    };

    return mapExceptions[message] ?? loc.unknownError;
  }
}
