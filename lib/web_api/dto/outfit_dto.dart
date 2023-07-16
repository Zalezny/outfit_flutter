
import 'package:outfit_flutter/web_api/dto/work_time.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'outfit_dto.freezed.dart';
part 'outfit_dto.g.dart';

@freezed
class OutfitDto with _$OutfitDto {
  const factory OutfitDto({
    @JsonKey(name: '_id') required String sId,
    required String title,
    String? hour,
    required String date,
    required List<WorkTime> momHours,
    required List<WorkTime> kateHours,
    @JsonKey(name: '__v') required int iV,
    required bool ended,
  }) = _OutfitDto;

  factory OutfitDto.fromJson(Map<String, Object?> json) => _$OutfitDtoFromJson(json);
}
