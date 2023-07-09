part of 'stopwatch_bloc.dart';

@immutable
abstract class StopwatchEvent {}

class StartStopwatchEvent extends StopwatchEvent {
  final String outfitId;
  StartStopwatchEvent(this.outfitId);
}

class FinishStopwatchEvent extends StopwatchEvent {}

class CheckStopwatchEvent extends StopwatchEvent {}

class TickStopwatchEvent extends StopwatchEvent {
  final int duration;
  TickStopwatchEvent(this.duration);
}
