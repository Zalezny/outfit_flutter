import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:outfit_flutter/repositories/model_repository.dart';
import 'package:outfit_flutter/web_api/dto/outfit_dto.dart';

part 'outfit_event.dart';
part 'outfit_state.dart';

@lazySingleton
class OutfitBloc extends Bloc<OutfitEvent, OutfitState> {
  final ModelRepository _model;

  OutfitBloc(this._model) : super(OutfitLoadingState()) {
    on<OutfitEvent>((event, emit) async {
      if (event is InitOutfitEvent) {
        emit(OutfitLoadingState());
        try {
          final outfits = await _model.readOutfitsLocal();
          emit(OutfitSuccessState(outfits));
        } catch (e) {
          emit(OutfitFailState(e.toString()));
        }
      } else if (event is AddOutfitEvent) {
        try {
          await _model.insertOutfit(event.outfitTitle);
          final outfits = await _model.readOutfitsLocal();
          emit(OutfitSuccessState(outfits));
        } catch (e) {
          emit(OutfitFailState(e.toString()));
        }
      } else if (event is DeleteOutfitEvent) {
        try {
          await _model.deleteOutfit(event.id);
          final outfits = await _model.readOutfitsLocal();
          emit(OutfitSuccessState(outfits));
        } catch (e) {
          emit(OutfitFailState(e.toString()));
        }
      } else if (event is ChangeEndedOutfitEvent) {
        try {
          _model.changeEndedById(event.id, event.isEnded);
          final outfits = await _model.readOutfitsLocal();
          emit(OutfitSuccessState(outfits));
        } catch (e) {
          emit(OutfitFailState(e.toString()));
        }
      }
    });
  }
}
