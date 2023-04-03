import 'package:flutter/material.dart';
import 'package:outfit_flutter/di/dependency_injection.dart';
import 'package:outfit_flutter/web_api/connections/outfit_connection.dart';

import 'app.dart';

void main() {
  runApp(const App());
  setupDependencyInjection();
}