part of 'stopwatch_bloc.dart';

@immutable
abstract class StopwatchState {}

class StopwatchInitial extends StopwatchState {}

class StopwatchRunningState extends StopwatchState {
  final String timeText;
  StopwatchRunningState({required this.timeText});
  @override
  String toString() {
    return 'StopwatchBlocServiceProgress timeText: $timeText';
  }
}

class StopwatchFailState extends StopwatchState {
  final String text;
  StopwatchFailState(this.text);
}
