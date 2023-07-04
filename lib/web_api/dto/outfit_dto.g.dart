// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outfit_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OutfitDto _$$_OutfitDtoFromJson(Map<String, dynamic> json) => _$_OutfitDto(
      sId: json['_id'] as String,
      title: json['title'] as String,
      hour: json['hour'] as String,
      date: json['date'] as String,
      momHours: (json['momHours'] as List<dynamic>)
          .map((e) => WorkTime.fromJson(e as Map<String, dynamic>))
          .toList(),
      kateHours: (json['kateHours'] as List<dynamic>)
          .map((e) => WorkTime.fromJson(e as Map<String, dynamic>))
          .toList(),
      iV: json['__v'] as int,
      ended: json['ended'] as bool,
    );

Map<String, dynamic> _$$_OutfitDtoToJson(_$_OutfitDto instance) =>
    <String, dynamic>{
      '_id': instance.sId,
      'title': instance.title,
      'hour': instance.hour,
      'date': instance.date,
      'momHours': instance.momHours,
      'kateHours': instance.kateHours,
      '__v': instance.iV,
      'ended': instance.ended,
    };
