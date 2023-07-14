import 'package:isar/isar.dart';
import 'package:outfit_flutter/isar_db/models/outfit_entity.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseRepository {
  static const _schema = [OutfitEntitySchema];
  static const _schemaName = 'OutfitSchema';

  Future<Isar> open() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    return await Isar.open(
      _schema,
      directory: documentsDirectory.path,
      name: _schemaName,
    );
  }
}
