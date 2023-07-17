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
  WorkTimeBloc(this._model, this._isKatyaLists, this._outfitId) : super(WorkTimeLoadingState()) {
    on<WorkTimeEvent>((event, emit) async {
      try {
        if (event is InitWorkTimeEvent) {
          emit(WorkTimeLoadingState());
          await _model.initWorkTimes(_outfitId, _isKatyaLists);
          emit(WorkTimeSuccessState(await _model.readWorkTime(_outfitId, _isKatyaLists)));
        } else if (event is DeleteWorkTimeEvent) {
          _model.deleteWorkTime(_outfitId, event.workTimeId, _isKatyaLists);
          emit(WorkTimeSuccessState(await _model.readWorkTime(_outfitId, _isKatyaLists)));
        } else if (event is AddWorkTimeEvent) {
          await _model.insertWorkTime(_outfitId, event.workTime, _isKatyaLists);
          emit(WorkTimeSuccessState(await _model.readWorkTime(_outfitId, _isKatyaLists)));
        } else if (event is InsertLocallyWorkTimeEvent) {
          _model.insertLocallyWorkTime(_outfitId, _isKatyaLists, event.workTime);
          emit(WorkTimeSuccessState(await _model.readWorkTime(_outfitId, _isKatyaLists)));
        } else if (event is DeleteLocallyWorkTimeEvent) {
          _model.deleteLocallyWorkTime(_outfitId, _isKatyaLists, event.workTimeId);
          emit(WorkTimeSuccessState(await _model.readWorkTime(_outfitId, _isKatyaLists)));
        }
      } catch (e) {
        emit(WorkTimeFailState(e.toString()));
      }
    });
  }
}
