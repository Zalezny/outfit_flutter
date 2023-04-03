import 'outfit_dto.dart';

class OutfitListDto {
  final List<OutfitDto>? outfits;

  OutfitListDto({required this.outfits});
  factory OutfitListDto.fromJson(List<dynamic> json) {
    List<OutfitDto> outfits = json.map((i) => OutfitDto.fromJson(i)).toList();
    return OutfitListDto(outfits: outfits);
  }
}
