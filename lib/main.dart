import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:outfit_flutter/services/stopwatch_service.dart';
import 'app.dart';
import 'di/injectable.dart';

void main() async {
  initializeDateFormatting('pl_PL');
  WidgetsFlutterBinding.ensureInitialized();
  await StopwatchService.initializeService();
  configureDependencies();
  runApp(const App());
}

