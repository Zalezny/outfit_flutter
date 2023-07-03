import 'dart:async';
import 'dart:ui';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:outfit_flutter/services/service_event.dart';

// this will be used as notification channel id
const notificationChannelId = 'stopwatch_service';

// this will be used for notification id, So you can update your custom notification with this id.
const notificationId = 100;

class StopwatchService {
  static int duration = 0;
  static Future<void> initializeService() async {
    final service = FlutterBackgroundService();

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      notificationChannelId, // id
      'Stopwatch Service', // title
      description: 'This channel is used for important notifications.', // description
      importance: Importance.max, // importance must be at low or higher level
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await service.configure(
      androidConfiguration: AndroidConfiguration(
        // this will be executed when app is in foreground or background in separated isolate
        onStart: onStart,

        // auto start service
        autoStart: false,
        isForegroundMode: true,

        notificationChannelId: notificationChannelId, // this must match with notification channel you created above.
        initialNotificationTitle: 'AWESOME SERVICE',
        initialNotificationContent: 'Initializing',
        foregroundServiceNotificationId: notificationId,
      ),
      iosConfiguration: IosConfiguration(),
    );
  }

  @pragma('vm:entry-point')
  static Future<void> onStart(ServiceInstance service) async {
    // Only available for flutter 3.0.0 and later
    DartPluginRegistrant.ensureInitialized();
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      duration++;
      if (service is AndroidServiceInstance) {
        if (await service.isForegroundService()) {
          flutterLocalNotificationsPlugin.show(
            notificationId,
            'COOL SERVICE',
            'Awesome ${duration.toString()}',
            const NotificationDetails(
              android: AndroidNotificationDetails(
                notificationChannelId,
                'MY FOREGROUND SERVICE',
                icon: 'ic_bg_service_small',
                ongoing: true,
              ),
            ),
          );
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

    // bring to foreground
  }
}
