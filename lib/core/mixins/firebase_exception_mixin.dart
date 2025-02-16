import 'package:firebase_core/firebase_core.dart';

import '../index.dart';

mixin FirebaseExceptionHandlerMixin {
  LoggerService get logService;

  void handleFirebaseException(FirebaseException e, StackTrace? stack) {
    logService.error(e.toString(), stack);
    throw FirebaseServicesException(e.code);
  }
}
