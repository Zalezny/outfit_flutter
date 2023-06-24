import 'package:flutter/material.dart';
import 'package:outfit_flutter/di/injectable.dart';

import 'app.dart';

void main() {
  configureDependencies();
  runApp(const App());
}
