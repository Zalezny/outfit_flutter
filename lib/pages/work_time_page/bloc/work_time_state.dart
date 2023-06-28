part of 'work_time_bloc.dart';

@immutable
abstract class WorkTimeState {}

class WorkTimeLoadingState extends WorkTimeState {
  @override
  String toString() => 'WorkTimeProgress {}';
}

class WorkTimeFailState extends WorkTimeState {
  final String message;
  WorkTimeFailState(this.message);
  @override
  String toString() => 'WorkTimeFail {message: $message}';
}

class WorkTimeSuccessState extends WorkTimeState {
  final List<WorkTime> model;
  WorkTimeSuccessState(this.model);
  @override
  String toString() => 'WorkTimeSuccess {model: $model}';
}