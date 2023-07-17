import 'package:injectable/injectable.dart';
import 'package:outfit_flutter/isar_db/models/outfit_entity.dart';
import 'package:outfit_flutter/isar_db/repositories/outfit_repository.dart';
import 'package:outfit_flutter/isar_db/repositories/work_time_repository.dart';
import 'package:outfit_flutter/web_api/dto/outfit_dto.dart';
import 'package:uuid/uuid.dart';

import '../web_api/dto/work_time.dart';

@lazySingleton
class ModelRepository {
  final OutfitRepository _outfitRepository = OutfitRepository();

  Future<List<OutfitDto>> readOutfitsLocal() async {
    return (await _outfitRepository.initOutfits()).map((outfitEntity) => outfitEntity.toOutfitDto()).toList();
  }

  Future<void> insertOutfit(String outfitName) async {
    //todo: if graphql is exist it will be change on optimization version
    try {
      await _outfitRepository.insertOutfit(OutfitEntity(
        id: const Uuid().v4(),
        title: outfitName,
        hour: null,
        date: DateTime.now().toIso8601String(),
        iV: 1,
        ended: false,
      ));
    } finally {}
  }

  Future<void> deleteOutfit(String id) async {
    try {
      await _outfitRepository.deleteOutfit(id);
    } catch (e) {
      Exception(e);
    }
  }

  Future<void> changeEndedById(String id, bool newValue) async {
    try {
      await _outfitRepository.updateEndedById(id, newValue);
    } catch (e) {
      Exception(e);
    }
  }

  Future<List<WorkTime>> readWorkTime(String outfitId, bool isKatyaTab) async {
    final repo = WorkTimeRepository(outfitId, isKatyaTab);
    await repo.init();
    final entities = await repo.readWorkTime();
    if (entities != null) return entities.map((entity) => entity.toWorkTimeDto()).toList();
    return [];
  }

  Future<void> insertWorkTime(String outfitId, WorkTime workTime, bool isKatyaTab) async {
    final repo = WorkTimeRepository(outfitId, isKatyaTab);
    await repo.init();

    try {

      await repo.insertWorkTime(_toWorkTimeEntity(workTime.copyWith(sId: const Uuid().v4()), isKatyaTab));

    } catch (e) {
      Exception(e);
    }
  }

  Future<void> deleteWorkTime(String outfitId, String workTimeId, bool isKatyaTab) async {
    final repo = WorkTimeRepository(outfitId, isKatyaTab);
    await repo.init();
    try {
      await repo.deleteWorkTime(workTimeId);
    } catch (e) {
      Exception(e);
    }
  }

  Future<void> insertLocallyWorkTime(String outfitId, bool isKatyaTab, WorkTime workTime) async {
    final repo = WorkTimeRepository(outfitId, isKatyaTab);
    await repo.insertWorkTime(_toWorkTimeEntity(workTime, isKatyaTab));
  }

  Future<void> deleteLocallyWorkTime(String outfitId, bool isKatyaTab, String workTimeId) async {
    final repo = WorkTimeRepository(outfitId, isKatyaTab);
    await repo.deleteWorkTime(workTimeId);
  }

  WorkTimeEntity _toWorkTimeEntity(WorkTime workTime, bool isKatya) {
    return WorkTimeEntity(
      id: workTime.sId,
      date: workTime.date,
      hour: workTime.hour,
      minute: workTime.minute,
      second: workTime.second,
      isKatya: isKatya,
    );
  }
}
