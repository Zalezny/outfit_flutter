import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:outfit_flutter/di/injectable.dart';
import 'package:outfit_flutter/utils/shared_preference.dart';
import 'package:outfit_flutter/web_api/const_database.dart';

import 'app.dart';

void main() {
  initializeDateFormatting('pl_PL');
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  SharedPreference().saveIsKatya(ConstDatabase.isKatya);
  runApp(const App());
}
