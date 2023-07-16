
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:outfit_flutter/isar_db/repositories/database_repository.dart';
import 'package:outfit_flutter/models/stopwatch_notification_model.dart';
import 'package:outfit_flutter/services/stopwatch_service.dart';
import 'pages/app_page/app.dart';
import 'di/injectable.dart';

void main() async {
  String? route;
  StopwatchNotificationModel? data;
  initializeDateFormatting('pl_PL');
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await StopwatchService.initializeService();
  await GetIt.I<DatabaseRepository>().open();

  ReceivedAction? receivedAction = await AwesomeNotifications().getInitialNotificationAction(
    removeFromActionEvents: false,
  );
  if (receivedAction?.buttonKeyPressed == 'FINISH_BUTTON') {
    route = '/stopwatch-pager';
    data = StopwatchNotificationModel.fromJson(receivedAction!.payload!);
    data = data.copyWith(isFinishStopwatch: true);
  }

  runApp(App(initialRoute: route, initData: data));
}
