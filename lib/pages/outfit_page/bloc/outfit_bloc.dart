import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:outfit_flutter/web_api/connections/outfit_connection.dart';
import 'package:outfit_flutter/web_api/dto/outfit_dto.dart';

part 'outfit_event.dart';
part 'outfit_state.dart';

class OutfitBloc extends Bloc<OutfitEvent, OutfitState> {
  final OutfitConnection _outfitConnection;
  late List<OutfitDto> outfits;

  OutfitBloc(this._outfitConnection) : super(OutfitLoadingState()) {
    on<OutfitEvent>((event, emit) async {
      emit(OutfitLoadingState());
      if (event is InitOutfitEvent) {
        try {
          outfits = (await _outfitConnection.getOutfits()).outfits!.reversed.toList();
          emit(OutfitSuccessState(outfits));
        } catch (e) {
          emit(OutfitFailState(e.toString()));
        }
      } else if (event is AddOutfitEvent) {
        try {
          _outfitConnection.postOutfit(event.outfit.title!);
          //TODO: When GraphQL is create, it will be change
          outfits = (await _outfitConnection.getOutfits()).outfits!.reversed.toList();
          // outfits.add(event.outfit);
          emit(OutfitSuccessState(outfits));
        } catch (e) {
          emit(OutfitFailState(e.toString()));
        }
      } else if (event is DeleteOutfitEvent) {
        try {
          _outfitConnection.deleteOutfit(event.id);
          final index = outfits.indexWhere((element) => element.sId == event.id);
          outfits.removeAt(index);
          emit(OutfitSuccessState(outfits));
        } catch (e) {
          emit(OutfitFailState(e.toString()));
        }
      }
    });
  }
}
