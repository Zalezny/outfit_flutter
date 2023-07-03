part of 'stopwatch_bloc.dart';

@immutable
abstract class StopwatchEvent {}

class StartStopwatchEvent extends StopwatchEvent {}

class FinishStopwatchEvent extends StopwatchEvent {}

class TickStopwatchEvent extends StopwatchEvent {
  final int duration;
  TickStopwatchEvent(this.duration);
}
