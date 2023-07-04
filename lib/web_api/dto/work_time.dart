import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'work_time.freezed.dart';
part 'work_time.g.dart';

@freezed
class WorkTime with _$WorkTime {
  const factory WorkTime({
    required int hour,
    required int minute,
    required int second,
    required String date,
    @JsonKey(name: '_id') required String sId,
  }) = _WorkTime;

  factory WorkTime.fromJson(Map<String, Object?> json) => _$WorkTimeFromJson(json);
}
