import 'package:isar/isar.dart';
import 'package:outfit_flutter/isar_db/utils/fast_hash.dart';

part 'outfit_entity.g.dart';

@collection
class OutfitEntity {
  @Index(unique: true)
  String? id;

  Id get isarId => fastHash(id!);

  String? title;

  String? hour;

  String? date;

  int? iV;

  bool? ended;

  List<WorkTimeEntity>? momHours;

  List<WorkTimeEntity>? kateHours;
}

@embedded
class WorkTimeEntity {

  int? hour;

  int? minute;

  int? second;

  String? date;
}
