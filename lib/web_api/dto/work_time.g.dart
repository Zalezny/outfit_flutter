// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorkTime _$$_WorkTimeFromJson(Map<String, dynamic> json) => _$_WorkTime(
      hour: json['hour'] as int,
      minute: json['minute'] as int,
      second: json['second'] as int,
      date: json['date'] as String,
      sId: json['_id'] as String,
    );

Map<String, dynamic> _$$_WorkTimeToJson(_$_WorkTime instance) =>
    <String, dynamic>{
      'hour': instance.hour,
      'minute': instance.minute,
      'second': instance.second,
      'date': instance.date,
      '_id': instance.sId,
    };
