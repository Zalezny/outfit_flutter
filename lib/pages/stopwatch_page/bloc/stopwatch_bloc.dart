import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:meta/meta.dart';
import 'package:outfit_flutter/models/stopwatch_notification_model.dart';
import 'package:outfit_flutter/pages/work_time_page/bloc/work_time_bloc.dart';
import 'package:outfit_flutter/services/service_event.dart';
import 'package:outfit_flutter/utils/time_utils.dart';

part 'stopwatch_event.dart';
part 'stopwatch_state.dart';

class StopwatchBloc extends Bloc<StopwatchEvent, StopwatchState> {
  final FlutterBackgroundService _flutterBackgroundService;
  final Bloc<WorkTimeEvent, WorkTimeState> _workTimeBloc;
  int _duration = 0;

  StreamSubscription<Map<String, dynamic>?>? _subscription;

  StopwatchBloc(this._flutterBackgroundService, this._workTimeBloc) : super(StopwatchInitial()) {
    on<StopwatchEvent>((event, emit) async {
      if (event is StartStopwatchEvent) {
        await _flutterBackgroundService.startService();
        _flutterBackgroundService.invoke(
          ServiceEvent.dataToPayload,
          StopwatchNotificationModel(outfitId: event.outfitId).toJson(),
        );

        add(TickStopwatchEvent(0));
        _subscription = _flutterBackgroundService.on(ServiceEvent.update).listen((body) {
          if (body != null) add(TickStopwatchEvent(int.parse(body['seconds'])));
        })
          ..onError((e) {
            emit(StopwatchFailState(e.toString()));
          });
      } else if (event is TickStopwatchEvent) {
        _duration = event.duration;
        emit(StopwatchRunningState(timeText: TimeUtils.stringifyTimeByInt(_duration)));
      } else if (event is FinishStopwatchEvent) {
        try {
          _flutterBackgroundService.invoke(ServiceEvent.stopService);
          _subscription?.cancel();
          _workTimeBloc.add(AddWorkTimeEvent(TimeUtils.generateWorkTime(_duration)));
          emit(StopwatchInitial());
        } catch (e) {
          emit(StopwatchFailState(e.toString()));
        }
      } else if (event is CheckStopwatchEvent) {
        if (await _flutterBackgroundService.isRunning()) {
          _subscription = _flutterBackgroundService.on(ServiceEvent.update).listen((body) {
            if (body != null) add(TickStopwatchEvent(int.parse(body['seconds'])));
          })
            ..onError((e) {
              emit(StopwatchFailState(e.toString()));
            });
        }
      }
    });
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }
}
