import 'package:flutter/material.dart';
import 'package:outfit_flutter/di/injectable.dart';
import 'package:outfit_flutter/utils/shared_preference.dart';
import 'package:outfit_flutter/web_api/const_database.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  SharedPreference().saveIsKatya(ConstDatabase.isKatya);
  runApp(const App());
}
