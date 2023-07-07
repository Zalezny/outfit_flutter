import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
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

  @pragma('vm:entry-point')
  static Future<void> onStart(ServiceInstance service) async {
    DartPluginRegistrant.ensureInitialized();
    //final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    final awesomeNotifications = AwesomeNotifications();
    var timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      duration++;
      if (service is AndroidServiceInstance) {
        if (await service.isForegroundService()) {
          await awesomeNotifications.createNotification(
            content: NotificationContent(
                id: notificationId,
                channelKey: notificationChannelId,
                title: 'Stoper Katya',
                body: 'Twój czas to: ${TimeUtils.stringifyTimeByInt(duration)}',
                payload: {},
                notificationLayout: NotificationLayout.BigText),
            actionButtons: [
              NotificationActionButton(
                  key: 'FINISH_BUTTON', label: 'FINISH', color: AppColors.red_1867, showInCompactView: true),
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

    if (service is AndroidServiceInstance) {
      service.on(ServiceEvent.setAsForeground).listen((event) {
        service.setAsForegroundService();
      });

      service.on(ServiceEvent.setAsBackground).listen((event) {
        service.setAsBackgroundService();
      });

      service.on(ServiceEvent.stopService).listen((event) {
        duration = 0;
        timer.cancel();
        service.stopSelf();
      });
    }
  }
}
