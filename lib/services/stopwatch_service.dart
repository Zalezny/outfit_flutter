import 'dart:async';
import 'dart:ui';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:outfit_flutter/services/service_event.dart';
import 'package:outfit_flutter/theme/app_colors.dart';
import 'package:outfit_flutter/utils/total_time_helper.dart';
import 'package:outfit_flutter/web_api/dto/work_time.dart';

const notificationChannelId = 'stopwatch_service';
const notificationId = 100;
const notificationTitle = 'Stopwatch Service';

class StopwatchService {
  static int duration = 0;
  static Future<void> initializeService() async {
    final service = FlutterBackgroundService();

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
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      duration++;
      if (service is AndroidServiceInstance) {
        if (await service.isForegroundService()) {
          flutterLocalNotificationsPlugin.show(
            notificationId,
            'Stoper Katya',
            'Twój czas to: ${generateTimeString(duration)}',
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

  static String generateTimeString(int duration) {
    final minutes = (duration / 60).truncate();
    final hours = (minutes / 60).truncate();
    final remainingMinutes = minutes % 60;
    final remainingSeconds = duration % 60;

    final helper = TotalTimeHelper();

    helper.addTotalTime(hours, remainingMinutes, remainingSeconds);

    return helper.getTime();
  }

  static WorkTime generateWorkTime(int duration) {
    final minutes = (duration / 60).truncate();
    final hours = (minutes / 60).truncate();
    final remainingMinutes = minutes % 60;
    final remainingSeconds = duration % 60;
    final now = DateTime.now();
    final formattedDateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(now);
    return WorkTime(
      sId: '',
      hour: hours,
      minute: remainingMinutes,
      second: remainingSeconds,
      date: formattedDateTime,
    );
  }
}
