import 'package:flutter/cupertino.dart';

import '../../../../core/index.dart';
import '../../../../gen/colors.gen.dart';

abstract class AppNotification {
  String getMessage(BuildContext context);
  Color get color;
}

class AppInfoNotification implements AppNotification {
  const AppInfoNotification(this._message);
  final LocalizedMessage _message;

  @override
  String getMessage(BuildContext context) => _message.localized(context);
  @override
  Color get color => AppColors.black;
}

class AppSuccessNotification implements AppNotification {
  const AppSuccessNotification(this._message);
  final LocalizedMessage _message;

  @override
  String getMessage(BuildContext context) => _message.localized(context);

  @override
  Color get color => AppColors.green;
}

class AppErrorNotification implements AppNotification {
  const AppErrorNotification(this._message);
  final LocalizedException _message;

  @override
  String getMessage(BuildContext context) => _message.localized(context);

  @override
  Color get color => AppColors.red;
}
