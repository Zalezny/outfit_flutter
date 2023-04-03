part of 'outfit_bloc.dart';

@immutable
abstract class OutfitState {
  const OutfitState();
}

class OutfitInitial extends OutfitState {

  @override
  String toString() => 'OutfitInitial {}';
}
