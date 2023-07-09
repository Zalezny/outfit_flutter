import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:outfit_flutter/app.dart';

class NotificationController {
  @pragma("vm:entry-point")
  static Future <void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    if(receivedAction.buttonKeyPressed == 'FINISH_BUTTON') {
      App.navigatorKey.currentState?.pushNamedAndRemoveUntil('/stopwatch-pager',
            (route) => (route.settings.name != '/stopwatch-pager') || route.isFirst,
        arguments: receivedAction);
    }
    
  }
}