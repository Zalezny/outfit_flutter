import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:outfit_flutter/pages/app_page/app.dart';
import 'package:outfit_flutter/models/stopwatch_notification_model.dart';

class NotificationController {
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    if (receivedAction.buttonKeyPressed == 'FINISH_BUTTON') {
        App.navigatorKey.currentState?.pushReplacementNamed(
          '/stopwatch-pager',
          // (route) => (route.settings.name != '/stopwatch-pager'),
          arguments: StopwatchNotificationModel.fromJson(receivedAction.payload!).copyWith(isFinishStopwatch: true),
        );
      
    }
  }
}
