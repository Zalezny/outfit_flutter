
import 'package:get_it/get_it.dart';
import 'package:outfit_flutter/web_api/connections/outfit_connection.dart';
import 'package:outfit_flutter/web_api/services/api_service.dart';

void setupDependencyInjection() {
  GetIt.I.registerLazySingleton(
    () => ApiService(),
  );
  GetIt.I.registerLazySingleton(
    () => OutfitConnection(),
  );
}