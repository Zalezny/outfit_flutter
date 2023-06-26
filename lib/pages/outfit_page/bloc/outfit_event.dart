part of 'outfit_bloc.dart';

@immutable
abstract class OutfitEvent {}

class InitOutfitEvent extends OutfitEvent {}

class DeleteOutfitEvent extends OutfitEvent {
  final String id;
  DeleteOutfitEvent(this.id);
}

class AddOutfitEvent extends OutfitEvent {
  final OutfitDto outfit;
  AddOutfitEvent(this.outfit);
}

class ChangeEndedOutfitEvent extends OutfitEvent {
  final String id;
  final bool isEnded;
  ChangeEndedOutfitEvent(this.id, this.isEnded);
}