import 'package:flutter/widgets.dart';

abstract interface class Localizable {
  String localized(BuildContext context);
}

abstract interface class LocalizedMessage implements Localizable {}

abstract interface class LocalizedException implements Exception, Localizable {}
