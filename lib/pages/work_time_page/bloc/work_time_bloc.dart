import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:outfit_flutter/repositories/model_repository.dart';
import 'package:outfit_flutter/web_api/dto/work_time.dart';

part 'work_time_event.dart';
part 'work_time_state.dart';

mixin KatyaWorkTimeBloc on Bloc<WorkTimeEvent, WorkTimeState> {}
mixin MomWorkTimeBloc on Bloc<WorkTimeEvent, WorkTimeState> {}

class WorkTimeBloc extends Bloc<WorkTimeEvent, WorkTimeState> with KatyaWorkTimeBloc, MomWorkTimeBloc {
  late List<WorkTime> _workTimes;
  final bool _isKatyaLists;
  final String _outfitId;
  final ModelRepository _model;
  WorkTimeBloc(this._model, this._isKatyaLists, this._outfitId) : super(WorkTimeLoadingState()) {
    on<WorkTimeEvent>((event, emit) async {
      try {
        if (event is InitWorkTimeEvent) {
          emit(WorkTimeLoadingState());
          _workTimes = await _model.readWorkTime(_outfitId, _isKatyaLists);
          // _workTimes = (await _workTimeConnection.getWorkTimes(_outfitId, _isKatyaLists)).reversed.toList();
        } else if (event is DeleteWorkTimeEvent) {
          _model.deleteWorkTime(_outfitId, event.workTimeId, _isKatyaLists);
          // await _workTimeConnection.deleteWorkTime(_outfitId, event.workTimeId, _isKatyaLists);
          _workTimes.removeWhere((element) => element.sId == event.workTimeId);
        } else if (event is AddWorkTimeEvent) {
          final idWorkTime = await _model.insertWorkTime(_outfitId, event.workTime, _isKatyaLists);
          // final idWorkTime = await _workTimeConnection.insertWorkTime(_outfitId, event.workTime, _isKatyaLists);
          if (idWorkTime != null) {
            final workTime = event.workTime.copyWith(sId: idWorkTime);
            _workTimes.insert(0, workTime);
          }
        } else if (event is InsertLocallyWorkTimeEvent) {
          _workTimes.insert(event.index, event.workTime);
        } else if (event is DeleteLocallyWorkTimeEvent) {
          _workTimes.removeWhere((element) => element.sId == event.workTimeId);
        }
        emit(WorkTimeSuccessState(_workTimes));
      } catch (e) {
        emit(WorkTimeFailState(e.toString()));
      }
    });
  }
}
