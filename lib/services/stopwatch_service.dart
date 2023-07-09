import 'dart:async';
import 'dart:ui';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:outfit_flutter/controllers/notification_controller.dart';
import 'package:outfit_flutter/models/stopwatch_notification_model.dart';
import 'package:outfit_flutter/services/service_event.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:outfit_flutter/theme/app_colors.dart';
import 'package:outfit_flutter/utils/time_utils.dart';

const notificationChannelId = 'stopwatch_service';
const notificationId = 100;
const notificationTitle = 'Stopwatch Service';

class StopwatchService {
  static int duration = 0;
  static Future<void> initializeService() async {
    final service = FlutterBackgroundService();
    final notification = AwesomeNotifications();

    notification.initialize(
      'resource://drawable/katya_logo',
      [
        NotificationChannel(
          channelKey: notificationChannelId,
          channelName: notificationTitle,
          channelDescription: notificationTitle,
          defaultColor: AppColors.red_1867,
          importance: NotificationImportance.Max,
        )
      ],
      debug: true,
    );

    /*
      const AndroidNotificationChannel channel = AndroidNotificationChannel(
      notificationChannelId,
      notificationTitle,
      description: 'This channel is used for katya stoper.',
      importance: Importance.max,
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
*/
    await service.configure(
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        autoStart: false,
        isForegroundMode: true,
        notificationChannelId: notificationChannelId,
        initialNotificationTitle: 'Stoper Katya',
        initialNotificationContent: 'Czeka na inicjalizacje',
        foregroundServiceNotificationId: notificationId,
      ),
      iosConfiguration: IosConfiguration(),
    );
  }

  static Future<void> startListeningNotificationEvents() async {
    AwesomeNotifications().setListeners(onActionReceivedMethod: NotificationController.onActionReceivedMethod);
  }

  @pragma('vm:entry-point')
  static Future<void> onStart(ServiceInstance service) async {
    DartPluginRegistrant.ensureInitialized();

    //final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    final awesomeNotifications = AwesomeNotifications();
    Map<String, String>? payload;
    if (service is AndroidServiceInstance) {
      service.on(ServiceEvent.setAsForeground).listen((_) {
        service.setAsForegroundService();
      });

      service.on(ServiceEvent.setAsBackground).listen((_) {
        service.setAsBackgroundService();
      });

      service.on(ServiceEvent.stopService).listen((_) {
        duration = 0;
        service.stopSelf();
      });
      service.on(ServiceEvent.dataToPayload).listen((event) {
        payload = StopwatchNotificationModel.fromJson(event!).toMapString();
      });
    }
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      duration++;
      if (service is AndroidServiceInstance) {
        if (await service.isForegroundService()) {
          NotificationContent notificationContent = NotificationContent(
              id: notificationId,
              channelKey: notificationChannelId,
              payload: payload,
              title: 'Stoper Katya',
              body: 'Twój czas to: ${TimeUtils.stringifyTimeByInt(duration)}',
              backgroundColor: AppColors.red_1867,
              notificationLayout: NotificationLayout.BigText);

          await awesomeNotifications.createNotification(
            content: notificationContent,
            actionButtons: [
              NotificationActionButton(
                key: 'FINISH_BUTTON',
                label: 'FINISH',
                color: AppColors.red_1867,
              ),
              NotificationActionButton(
                key: 'GO_BUTTON',
                label: 'GO',
                color: AppColors.red_1867,
              ),
            ],
          );

          /*
          flutterLocalNotificationsPlugin.show(
            notificationId,
            'Stoper Katya',
            'Twój czas to: ${TimeUtils.stringifyTimeByInt(duration)}',
            const NotificationDetails(
              android: AndroidNotificationDetails(
                notificationChannelId,
                notificationTitle,
                icon: 'katya_logo',
                colorized: true,
                color: AppColors.red_1867,
                ongoing: true,
              ),
            ),
          );
          */
        }
      }

      service.invoke(ServiceEvent.update, {'seconds': duration.toString()});
    });
  }
}
