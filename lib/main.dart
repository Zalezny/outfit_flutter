import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:outfit_flutter/di/injectable.dart';

import 'app.dart';

void main() {
  initializeDateFormatting('pl_PL');
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const App());
}
