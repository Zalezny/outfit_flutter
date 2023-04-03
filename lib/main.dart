import 'package:flutter/material.dart';
import 'package:outfit_flutter/di/dependency_injection.dart';

import 'app.dart';

void main() {
  setupDependencyInjection();
  runApp(const App());
}