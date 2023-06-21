import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:outfit_flutter/web_api/connections/outfit_connection.dart';
import 'package:outfit_flutter/web_api/dto/outfit_list_dto.dart';

part 'outfit_event.dart';
part 'outfit_state.dart';

class OutfitBloc extends Bloc<OutfitEvent, OutfitState> {
  final OutfitConnection _outfitConnection;

  OutfitBloc(this._outfitConnection) : super(OutfitLoadingState()) {
    on<OutfitEvent>((event, emit) async {
      emit(OutfitLoadingState());
      try {
        final model = await _outfitConnection.getOutfits();
        emit(OutfitSuccessState(model));
      } catch (e) {
        emit(OutfitFailState(e.toString()));
      }
    });
  }
}
