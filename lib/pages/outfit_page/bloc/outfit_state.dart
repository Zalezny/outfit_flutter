part of 'outfit_bloc.dart';

@immutable
abstract class OutfitState {}

// class OutfitInitial extends OutfitState {
//   @override
//   String toString() => 'OutfitInitial {}';
// }

class OutfitLoadingState extends OutfitState {
  @override
  String toString() => 'OutfitProgress {}';
}

class OutfitFailState extends OutfitState {
  final String message;
  OutfitFailState(this.message);

  @override
  String toString() => 'OutfitFail {message: $message}';
}

class OutfitSuccessState extends OutfitState {
  final List<OutfitDto> model;
  OutfitSuccessState(this.model);

  @override
  String toString() => 'OutfitSuccess {model: $model}';
}
