import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:outfit_flutter/isar_db/models/outfit_entity.dart';

import 'database_repository.dart';

class WorkTimeRepository {
  final bool isKatyaList;
  final String outfitId;
  Isar? _db;
  WorkTimeRepository(this.outfitId, this.isKatyaList);

  IsarCollection<WorkTimeEntity> _workTimeCollection() => _db!.collection<WorkTimeEntity>();

  Future<void> init() async {
    _db = await GetIt.I<DatabaseRepository>().database;
  }

  Future<List<WorkTimeEntity>?> readWorkTime() async {
    if (_db == null) await init();

    return await _workTimeCollection().where().filter().isKatyaEqualTo(isKatyaList).sortByDateDesc().findAll();
  }

  Future<void> insertWorkTime(WorkTimeEntity workTime) async {
    if (_db == null) await init();

    await _db?.writeTxn(() async {
      await _workTimeCollection().put(workTime);
    });
  }

  Future<void> insertWorkTimes(List<WorkTimeEntity> workTimes) async {
    if (_db == null) await init();

    await _db?.writeTxn(() async {
      await _workTimeCollection().clear();
      await _workTimeCollection().putAll(workTimes);
    });
  }

  Future<void> deleteWorkTime(String workTimeId) async {
    if (_db == null) await init();

    await _db?.writeTxn(() async {
      await _workTimeCollection().deleteById(workTimeId);
    });
  }
}
