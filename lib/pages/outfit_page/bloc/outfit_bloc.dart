import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:outfit_flutter/web_api/connections/outfit_connection.dart';
import 'package:outfit_flutter/web_api/dto/outfit_dto.dart';

part 'outfit_event.dart';
part 'outfit_state.dart';

@lazySingleton
class OutfitBloc extends Bloc<OutfitEvent, OutfitState> {
  final OutfitConnection _outfitConnection;
  late List<OutfitDto> outfits;

  OutfitBloc(this._outfitConnection) : super(OutfitLoadingState()) {
    on<OutfitEvent>((event, emit) async {
      if (event is InitOutfitEvent) {
        emit(OutfitLoadingState());
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
      } else if (event is ChangeEndedOutfitEvent) {
        try {
          final index = outfits.indexWhere((element) => element.sId == event.id);
          final oldOutfit = outfits[index].copyWith(ended: event.isEnded);
          outfits.removeAt(index);
          outfits.insert(index, oldOutfit);
          _outfitConnection.patchEndedById(event.id, event.isEnded);
          emit(OutfitSuccessState(outfits));
        } catch (e) {
          emit(OutfitFailState(e.toString()));
        }
      }
    });
  }
}
