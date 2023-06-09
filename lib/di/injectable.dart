
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:outfit_flutter/di/injectable.config.dart';

final getIt = GetIt.instance;

@module
abstract class InjectableModule {
  @lazySingleton
  FlutterBackgroundService get flutterBackgroundService => FlutterBackgroundService();
  
}

@InjectableInit()
void configureDependencies() => getIt.init();