import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:outfit_flutter/repositories/model_repository.dart';
import 'package:outfit_flutter/web_api/dto/work_time.dart';

part 'work_time_event.dart';
part 'work_time_state.dart';

mixin KatyaWorkTimeBloc on Bloc<WorkTimeEvent, WorkTimeState> {}
mixin MomWorkTimeBloc on Bloc<WorkTimeEvent, WorkTimeState> {}

class WorkTimeBloc extends Bloc<WorkTimeEvent, WorkTimeState> with KatyaWorkTimeBloc, MomWorkTimeBloc {
  final bool _isKatyaLists;
  final String _outfitId;
  final ModelRepository _model;
  late List<WorkTime> _localWorkTimes;
  WorkTimeBloc(this._model, this._isKatyaLists, this._outfitId) : super(WorkTimeLoadingState()) {
    on<WorkTimeEvent>((event, emit) async {
      try {
        if (event is InitWorkTimeEvent) {
          emit(WorkTimeLoadingState());
          await _model.readWorkTime(_outfitId, _isKatyaLists);
          _localWorkTimes = await _model.readWorkTime(_outfitId, _isKatyaLists);
        } else if (event is DeleteWorkTimeEvent) {
          await _model.deleteWorkTime(_outfitId, event.workTimeId, _isKatyaLists);
          _localWorkTimes = await _model.readWorkTime(_outfitId, _isKatyaLists);
        } else if (event is AddWorkTimeEvent) {
          await _model.insertWorkTime(_outfitId, event.workTime, _isKatyaLists);
          _localWorkTimes.insert(0, event.workTime);
        } else if (event is InsertLocallyWorkTimeEvent) {
          _localWorkTimes.insert(event.index, event.workTime);
        } else if (event is DeleteLocallyWorkTimeEvent) {
          _localWorkTimes.removeWhere((element) => element.sId == event.workTimeId);
        }
        emit(WorkTimeSuccessState(_localWorkTimes));
      } catch (e) {
        emit(WorkTimeFailState(e.toString()));
      }
    });
  }
}
