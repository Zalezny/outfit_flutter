import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:outfit_flutter/isar_db/models/outfit_entity.dart';

import 'database_repository.dart';

class OutfitRepository {
  final _db = Isar.getInstance(DatabaseRepository.schemaName);

  Future<IsarCollection<OutfitEntity>> _outfitCollection() async {
    if (_db != null) {
      return _db!.collection<OutfitEntity>();
    } else {
      final isar = await GetIt.I<DatabaseRepository>().open();

      return isar.collection<OutfitEntity>();
    }
  }

  Future<List<OutfitEntity>> readOutfits() async {
    return await (await _outfitCollection()).where().findAll();
  }

  Future<int?> insertOutfit(OutfitEntity outfit) async {
    await _db!.writeTxn(() async {
      return await (await _outfitCollection()).put(outfit);
    });
    return null;
  }

  Future<void> insertOutfits(List<OutfitEntity> outfits) async {
    await _db!.writeTxn(() async {
      return await (await _outfitCollection()).putAll(outfits);
    });
  }

  Future<void> updateEndedById(String id, bool isEnded) async {
    final outfitCollection = await _outfitCollection();
    final outfit = await outfitCollection.where().idEqualTo(id).findFirst();
    if (outfit != null) {
      outfit.ended = isEnded;
      await outfitCollection.put(outfit);
    }
  }

  Future<void> deleteOutfit(String id) async {
    final outfitCollection = await _outfitCollection();
    final outfit = await outfitCollection.where().idEqualTo(id).findFirst();
    if (outfit != null) outfitCollection.delete(outfit.isarId);
  }
}
