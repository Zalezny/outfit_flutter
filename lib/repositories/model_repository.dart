import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:outfit_flutter/isar_db/models/outfit_entity.dart';
import 'package:outfit_flutter/isar_db/repositories/outfit_repository.dart';
import 'package:outfit_flutter/isar_db/repositories/work_time_repository.dart';
import 'package:outfit_flutter/utils/shared_preference.dart';
import 'package:outfit_flutter/web_api/connections/work_time_connection.dart';
import 'package:outfit_flutter/web_api/dto/outfit_dto.dart';

import '../web_api/connections/outfit_connection.dart';
import '../web_api/dto/work_time.dart';

@lazySingleton
class ModelRepository {
  final OutfitConnection _outfitConnection = GetIt.I<OutfitConnection>();
  final OutfitRepository _outfitRepository = OutfitRepository();
  final WorkTimeConnection _workTimeConnection = GetIt.I<WorkTimeConnection>();

  Future<List<OutfitDto>> initOutfits() async {
    try {
      final outfits = await _outfitConnection.getOutfits();
      await _outfitRepository.insertOutfits(outfits.map((outfit) => _toOutfitEntity(outfit)).toList());
    } finally {}
    return (await _outfitRepository.initOutfits()).map((outfitEntity) => outfitEntity.toOutfitDto()).toList();
  }

  Future<List<OutfitDto>> readOutfitsLocal() async {
    return (await _outfitRepository.initOutfits()).map((outfitEntity) => outfitEntity.toOutfitDto()).toList();
  }

  Future<void> insertOutfit(String outfitName) async {
    //todo: if graphql is exist it will be change on optimization version
    try {
      await _outfitConnection.postOutfit(outfitName);
      final outfits = await _outfitConnection.getOutfits();
      await _outfitRepository.insertOutfits(outfits.map((outfit) => _toOutfitEntity(outfit)).toList());
    } finally {}
  }

  Future<void> deleteOutfit(String id) async {
    try {
      await _outfitConnection.deleteOutfit(id);
      await _outfitRepository.deleteOutfit(id);
    } catch (e) {
      Exception(e);
    }
  }

  Future<void> changeEndedById(String id, bool newValue) async {
    try {
      await _outfitConnection.patchEndedById(id, newValue);
      await _outfitRepository.updateEndedById(id, newValue);
    } catch (e) {
      Exception(e);
    }
  }

  Future<List<WorkTime>> readWorkTime(String outfitId, bool isKatyaTab) async {
    final repo = WorkTimeRepository(outfitId, isKatyaTab);
    repo.init();
    final entities = await repo.readWorkTime();
    if (entities != null) return entities.map((entity) => entity.toWorkTimeDto()).toList();
    return [];
  }

  Future<String?> insertWorkTime(String outfitId, WorkTime workTime, bool isKatyaTab) async {
    final isKatya = await GetIt.I<SharedPreference>().getIsKatya();
    final repo = WorkTimeRepository(outfitId, isKatyaTab);
    repo.init();

    if (isKatya == null) return null;

    try {
      await repo.insertWorkTime(_toWorkTimeEntity(workTime));
      return await _workTimeConnection.insertWorkTime(outfitId, workTime, isKatya);
    } catch (e) {
      Exception(e);
    }
    return null;
  }

  Future<void> deleteWorkTime(String outfitId, String workTimeId, bool isKatyaTab) async {
    final repo = WorkTimeRepository(outfitId, isKatyaTab);
    repo.init();
    try {
      await _workTimeConnection.deleteWorkTime(outfitId, workTimeId, isKatyaTab);
      await repo.deleteWorkTime(workTimeId);
    } catch (e) {
      Exception(e);
    }
  }

  OutfitEntity _toOutfitEntity(OutfitDto outfit) {
    return OutfitEntity(
      id: outfit.sId,
      date: outfit.date,
      title: outfit.title,
      iV: outfit.iV,
      hour: outfit.hour,
      ended: outfit.ended,
      kateHours: outfit.kateHours
          .map(
            (workTime) => WorkTimeEntity()
              ..date = workTime.date
              ..hour = workTime.hour
              ..id = workTime.sId
              ..minute = workTime.minute
              ..second = workTime.second,
          )
          .toList(),
      momHours: outfit.momHours
          .map(
            (workTime) => WorkTimeEntity()
              ..date = workTime.date
              ..hour = workTime.hour
              ..id = workTime.sId
              ..minute = workTime.minute
              ..second = workTime.second,
          )
          .toList(),
    );
  }

  WorkTimeEntity _toWorkTimeEntity(WorkTime workTime) {
    return WorkTimeEntity()
      ..date = workTime.date
      ..hour = workTime.hour
      ..id = workTime.sId
      ..minute = workTime.minute
      ..second = workTime.second;
  }
}
