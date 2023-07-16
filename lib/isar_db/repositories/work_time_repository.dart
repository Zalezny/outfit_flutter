import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:outfit_flutter/isar_db/models/outfit_entity.dart';
import 'package:outfit_flutter/utils/shared_preference.dart';

import 'database_repository.dart';

class WorkTimeRepository {
  late bool? _isKatya;
  final String outfitId;
  late OutfitEntity _outfit;
  late Isar _db;
  WorkTimeRepository(this.outfitId) {
    _init();
  }

  Future<IsarCollection<OutfitEntity>> _outfitCollection() async => _db.collection<OutfitEntity>();

  Future<void> _init() async {
    _isKatya = await GetIt.I<SharedPreference>().getIsKatya();
    final isarOut = await _outfitCollection();
    final initOutfit = await isarOut.where().idEqualTo(outfitId).findFirst();
    if (initOutfit != null) _outfit = initOutfit;
    _db = await GetIt.I<DatabaseRepository>().database;
  }

  Future<List<WorkTimeEntity>?> readWorkTime() async {
    if (_isKatya == null) return null;

    return _isKatya! ? _outfit.kateHours! : _outfit.momHours!;
  }

  Future<void> insertWorkTime(WorkTimeEntity workTime) async {
    if (_isKatya == null) return;

    final isarOut = await _outfitCollection();
    _isKatya! ? _outfit.kateHours!.add(workTime) : _outfit.momHours!.add(workTime);
    await _db.writeTxn(() async {
      await isarOut.put(_outfit);
    });
  }

  Future<void> deleteWorkTime(String workTimeId) async {
    if (_isKatya == null) return;

    final isarOut = await _outfitCollection();

    final workTimes = _isKatya! ? _outfit.kateHours : _outfit.momHours;
    if (workTimes != null) workTimes.removeWhere((workTime) => workTime.id == workTimeId);
    _isKatya! ? _outfit.kateHours = workTimes : _outfit.momHours = workTimes;
    await _db.writeTxn(() async {
      await isarOut.put(_outfit);
    });
  }
}
