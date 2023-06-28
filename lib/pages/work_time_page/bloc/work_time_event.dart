part of 'work_time_bloc.dart';

@immutable
abstract class WorkTimeEvent {}

class DeleteWorkTimeEvent extends WorkTimeEvent {
  final String workTimeId;
  DeleteWorkTimeEvent(this.workTimeId);
}

class AddWorkTimeEvent extends WorkTimeEvent {
  final WorkTime workTime;
  AddWorkTimeEvent(this.workTime);
}

class InitWorkTimeEvent extends WorkTimeEvent {
  final String id;
  InitWorkTimeEvent(this.id);
}