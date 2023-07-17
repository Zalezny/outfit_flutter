import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:outfit_flutter/isar_db/models/outfit_entity.dart';
import 'package:outfit_flutter/utils/shared_preference.dart';

import 'database_repository.dart';

class WorkTimeRepository {
  final bool _isKatyaList;
  final String outfitId;
  late OutfitEntity _outfit;
  Isar? _db;
  WorkTimeRepository(this.outfitId, this._isKatyaList);

  Future<IsarCollection<OutfitEntity>> _outfitCollection() async => _db!.collection<OutfitEntity>();

  Future<void> init() async {
    _db = await GetIt.I<DatabaseRepository>().database;
    final isarOut = await _outfitCollection();
    final initOutfit = await isarOut.where().idEqualTo(outfitId).findFirst();
    if (initOutfit != null) _outfit = initOutfit;
  }

  Future<List<WorkTimeEntity>?> readWorkTime() async {
    if (_db == null) await init();

    return _isKatyaList ? _outfit.kateHours! : _outfit.momHours!;
  }

  Future<void> insertWorkTime(WorkTimeEntity workTime) async {
    if (_db == null) await init();

    final isarOut = await _outfitCollection();
    _isKatyaList ? _outfit.kateHours!.insert(0, workTime) : _outfit.momHours!.insert(0, workTime);
    await _db?.writeTxn(() async {
      await isarOut.put(_outfit);
    });
  }

  Future<void> deleteWorkTime(String workTimeId) async {
    if (_db == null) await init();

    final isarOut = await _outfitCollection();

    final workTimes = _isKatyaList ? _outfit.kateHours : _outfit.momHours;
    if (workTimes != null) workTimes.removeWhere((workTime) => workTime.id == workTimeId);
    _isKatyaList ? _outfit.kateHours = workTimes : _outfit.momHours = workTimes;
    await _db?.writeTxn(() async {
      await isarOut.put(_outfit);
    });
  }
}
