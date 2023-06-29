import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:outfit_flutter/web_api/connections/work_time_connection.dart';
import 'package:outfit_flutter/web_api/dto/work_time.dart';

part 'work_time_event.dart';
part 'work_time_state.dart';

mixin KatyaWorkTimeBloc on Bloc<WorkTimeEvent, WorkTimeState> {}
mixin MomWorkTimeBloc on Bloc<WorkTimeEvent, WorkTimeState> {}

class WorkTimeBloc extends Bloc<WorkTimeEvent, WorkTimeState> with KatyaWorkTimeBloc, MomWorkTimeBloc {
  final WorkTimeConnection _workTimeConnection;
  late List<WorkTime> _workTimes;
  final bool _isKatyaLists;
  final String _outfitId;
  WorkTimeBloc(this._workTimeConnection, this._isKatyaLists, this._outfitId) : super(WorkTimeLoadingState()) {
    on<WorkTimeEvent>((event, emit) async {
      try {
        if (event is InitWorkTimeEvent) {
          emit(WorkTimeLoadingState());
          _workTimes = (await _workTimeConnection.getWorkTimes(_outfitId, _isKatyaLists)).reversed.toList();
          emit(WorkTimeSuccessState(_workTimes));
        } else if (event is DeleteWorkTimeEvent) {
          await _workTimeConnection.deleteWorkTime(_outfitId, event.workTimeId, _isKatyaLists);
          _workTimes.removeWhere((element) => element.sId == event.workTimeId);
          emit(WorkTimeSuccessState(_workTimes));
        } else if (event is AddWorkTimeEvent) {
          await _workTimeConnection.insertWorkTime(_outfitId, event.workTime, _isKatyaLists);
          _workTimes.add(event.workTime);
          emit(WorkTimeSuccessState(_workTimes));
        } else if (event is InsertLocallyWorkTimeEvent) {
          _workTimes.insert(event.index, event.workTime);
          emit(WorkTimeSuccessState(_workTimes));
        } else if (event is DeleteLocallyWorkTimeEvent) {
          _workTimes.removeWhere((element) => element.sId == event.workTimeId);
          emit(WorkTimeSuccessState(_workTimes));
        }
      } catch (e) {
        emit(WorkTimeFailState(e.toString()));
      }
    });
  }
}
