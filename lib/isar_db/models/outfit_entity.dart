import 'package:isar/isar.dart';
import 'package:outfit_flutter/isar_db/utils/fast_hash.dart';
import 'package:outfit_flutter/web_api/dto/outfit_dto.dart';
import 'package:outfit_flutter/web_api/dto/work_time.dart';

part 'outfit_entity.g.dart';

@collection
class OutfitEntity {
  @Index(unique: true, replace: true)
  String id;

  Id get isarId => fastHash(id);

  String title;

  String? hour;

  String date;

  int iV;

  bool ended;

  List<WorkTimeEntity>? momHours;

  List<WorkTimeEntity>? kateHours;
  OutfitEntity(
      {required this.id,
      required this.title,
      required this.hour,
      required this.date,
      required this.iV,
      required this.ended,
      this.kateHours,
      this.momHours});

  OutfitDto toOutfitDto() => OutfitDto(
      sId: id,
      title: title,
      date: date,
      momHours: momHours!
          .map((workTimeEntity) => WorkTime(
              hour: workTimeEntity.hour!,
              minute: workTimeEntity.minute!,
              second: workTimeEntity.second!,
              date: workTimeEntity.date!,
              sId: workTimeEntity.id!))
          .toList(),
      kateHours: kateHours!
          .map((workTimeEntity) => WorkTime(
              hour: workTimeEntity.hour!,
              minute: workTimeEntity.minute!,
              second: workTimeEntity.second!,
              date: workTimeEntity.date!,
              sId: workTimeEntity.id!))
          .toList(),
      iV: iV,
      ended: ended,
      hour: hour);
}

@embedded
class WorkTimeEntity {
  String? id;

  int? hour;

  int? minute;

  int? second;

  String? date;


}
