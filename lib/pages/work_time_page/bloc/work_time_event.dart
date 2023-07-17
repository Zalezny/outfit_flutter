part of 'work_time_bloc.dart';

@immutable
abstract class WorkTimeEvent {}

class DeleteWorkTimeEvent extends WorkTimeEvent {
  final String workTimeId;
  DeleteWorkTimeEvent(this.workTimeId);
}

class DeleteLocallyWorkTimeEvent extends WorkTimeEvent {
  final String workTimeId;
  DeleteLocallyWorkTimeEvent(this.workTimeId);
}

class AddWorkTimeEvent extends WorkTimeEvent {
  final WorkTime workTime;
  AddWorkTimeEvent(this.workTime);
}

class InsertLocallyWorkTimeEvent extends WorkTimeEvent {
  final WorkTime workTime;
  final int index;
  InsertLocallyWorkTimeEvent(this.workTime, this.index);
}

class InitWorkTimeEvent extends WorkTimeEvent {
  InitWorkTimeEvent();
}