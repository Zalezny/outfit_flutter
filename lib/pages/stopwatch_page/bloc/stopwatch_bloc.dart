import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:meta/meta.dart';
import 'package:outfit_flutter/services/service_event.dart';
import 'package:outfit_flutter/services/stopwatch_service.dart';

part 'stopwatch_event.dart';
part 'stopwatch_state.dart';

class StopwatchBloc extends Bloc<StopwatchEvent, StopwatchState> {
  final FlutterBackgroundService _flutterBackgroundService;

  StreamSubscription<Map<String, dynamic>?>? _subscription;

  StopwatchBloc(this._flutterBackgroundService) : super(StopwatchInitial()) {
    on<StopwatchEvent>((event, emit) async {
      if (event is StartStopwatchEvent) {
        _flutterBackgroundService.startService();
        add(TickStopwatchEvent(0));
        _subscription = FlutterBackgroundService().on(ServiceEvent.update).listen((body) {
          if (body != null) add(TickStopwatchEvent(int.parse(body['seconds'])));
        })
          ..onError((e) {
            emit(StopwatchFailState(e.toString()));
          });
      } else if (event is TickStopwatchEvent) {
        emit(StopwatchRunningState(timeText: StopwatchService.generateTimeString(event.duration)));
      } else if (event is FinishStopwatchEvent) {
        _flutterBackgroundService.invoke(ServiceEvent.stopService);
        _subscription?.cancel();
        emit(StopwatchInitial());
      }
    });
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }

  
}
