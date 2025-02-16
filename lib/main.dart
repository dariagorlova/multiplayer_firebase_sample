import 'package:flutter/material.dart';

import 'core/index.dart';
import 'features/navigation/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDI();

  runApp(const App());
}
