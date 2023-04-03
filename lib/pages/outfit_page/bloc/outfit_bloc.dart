import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'outfit_event.dart';
part 'outfit_state.dart';

class OutfitBloc extends Bloc<OutfitEvent, OutfitState> {
  OutfitBloc() : super(OutfitInitial()) {
    on<OutfitEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
