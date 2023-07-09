import 'dart:async';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
// ignore: unused_import
import 'package:outfit_flutter/pages/stopwatch_page/bloc/stopwatch_bloc.dart';
import 'package:outfit_flutter/services/service_event.dart';
import 'package:outfit_flutter/utils/shared_preference.dart';
import 'package:outfit_flutter/web_api/connections/work_time_connection.dart';

import 'time_utils.dart';

@lazySingleton
class NotificationHandler {
StreamSubscription<Map<String, dynamic>?>? _subscription;
Future<void> onFinishHandler(String outfitId) async {
    final service = GetIt.I<FlutterBackgroundService>();
    service.startService();
    
     _subscription = service.on(ServiceEvent.update).listen((body) {
      if(body != null) {
        final int duration = int.parse(body['seconds']);
        if(duration != 0) {
          _pushWorkTime(outfitId, duration).then((_) {
            service.invoke(ServiceEvent.stopService);
            dispose();
          });
        }
      }
      
    });
  }

  Future<void> _pushWorkTime(String outfitId, int duration) async {
    final isKatya = await GetIt.I<SharedPreference>().getIsKatya();
   await GetIt.I<WorkTimeConnection>().insertWorkTime(outfitId, TimeUtils.generateWorkTime(duration), isKatya!);
  }

  void dispose() {
    _subscription?.cancel();
  }
}
