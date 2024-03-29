import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:outfit_flutter/isar_db/models/outfit_entity.dart';
import 'package:path_provider/path_provider.dart';

@lazySingleton
class DatabaseRepository {
  static const _schema = [OutfitEntitySchema, WorkTimeEntitySchema];
  static const schemaName = 'OutfitSchema';

  Future<Isar> open() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    return await Isar.open(
      _schema,
      directory: documentsDirectory.path,
      name: schemaName,
    );
  }

  Future<Isar> get database async {
    final db = Isar.getInstance(DatabaseRepository.schemaName);
    if (db != null) {
      return db;
    } else {
      return await open();
    }
  }
}
