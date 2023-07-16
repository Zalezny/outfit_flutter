import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:outfit_flutter/isar_db/models/outfit_entity.dart';

import 'database_repository.dart';

class OutfitRepository {
  final _db = GetIt.I<DatabaseRepository>().database;

  Future<IsarCollection<OutfitEntity>> _outfitCollection() async => (await _db).collection<OutfitEntity>();

  Future<List<OutfitEntity>> initOutfits() async {
    return await (await _outfitCollection()).where().sortByDateDesc().findAll();
  }

  Future<int?> insertOutfit(OutfitEntity outfit) async {
    await (await _db).writeTxn(() async {
      return await (await _outfitCollection()).put(outfit);
    });
    return null;
  }

  Future<void> insertOutfits(List<OutfitEntity> outfits) async {
    await (await _db).writeTxn(() async {
      (await _outfitCollection()).clear();
      return await (await _outfitCollection()).putAll(outfits);
    });
  }

  Future<void> updateEndedById(String id, bool isEnded) async {
    await (await _db).writeTxn(() async {
      final outfitCollection = await _outfitCollection();
      final outfit = await outfitCollection.where().idEqualTo(id).findFirst();
      if (outfit != null) {
        outfit.ended = isEnded;
        await outfitCollection.put(outfit);
      }
    });
  }

  Future<void> deleteOutfit(String id) async {
    await (await _db).writeTxn(() async {
      final outfitCollection = await _outfitCollection();
      final outfit = await outfitCollection.where().idEqualTo(id).findFirst();
      if (outfit != null) outfitCollection.deleteById(outfit.id);
    });
  }
}
