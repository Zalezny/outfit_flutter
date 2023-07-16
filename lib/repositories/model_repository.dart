import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:outfit_flutter/isar_db/models/outfit_entity.dart';
import 'package:outfit_flutter/isar_db/repositories/outfit_repository.dart';
import 'package:outfit_flutter/web_api/dto/outfit_dto.dart';

import '../web_api/connections/outfit_connection.dart';

@lazySingleton
class ModelRepository {
  final OutfitConnection _outfitConnection = GetIt.I<OutfitConnection>();
  final OutfitRepository _outfitRepository = OutfitRepository();

  Future<List<OutfitDto>> readOutfits() async {
    try {
      final outfits = await _outfitConnection.getOutfits();
      await _outfitRepository.insertOutfits(outfits.map((outfit) => _toOutfitEntity(outfit)).toList());
    } finally {}
    return (await _outfitRepository.readOutfits()).map((outfitEntity) => outfitEntity.toOutfitDto()).toList();
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
}
