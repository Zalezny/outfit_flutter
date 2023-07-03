import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:outfit_flutter/web_api/connections/outfit_connection.dart';
import 'package:outfit_flutter/web_api/const_database.dart';
import 'package:outfit_flutter/web_api/dto/work_time.dart';

import '../services/api_service.dart';

@lazySingleton
class WorkTimeConnection {
  final _apiService = GetIt.I<ApiService>();
  final _outfitConnection = GetIt.I<OutfitConnection>();

  Future<List<WorkTime>> getWorkTimes(String id, bool isKatyaListNeed) async {
    try {
      final outfits = await _outfitConnection.getOutfits();
      for (var outfit in outfits.outfits!) {
        if (outfit.sId == id) {
          return isKatyaListNeed ? outfit.kateHours! : outfit.momHours!;
        }
      }
    } catch (e) {
      Exception(e);
    }
    return [];
  }

  Future<int> deleteWorkTime(String outfitId, String workTimeId, bool isKatya) async {
    final uri = ConstDatabase.outfitUrlByWorkTimeId(outfitId, workTimeId);
    final body = {'person': isKatya ? ConstDatabase.katyaNumber : ConstDatabase.momNumber};
    final Response response = await _apiService.patch(uri, jsonEncode(body));
    return response.statusCode;
  }

  Future<String> insertWorkTime(String outfitId, WorkTime workTime, bool isKatya) async {
    final body = {
      'person': isKatya ? ConstDatabase.katyaNumber : ConstDatabase.momNumber,
      'hour': workTime.hour,
      'minute': workTime.minute,
      'second': workTime.second,
      'date': workTime.date,
    };
    final Response response = await _apiService.patch(ConstDatabase.outfitUrlById(outfitId), jsonEncode(body));

    if (response.statusCode / ~100 == 2) {
      final bodyList = json.decode(response.body);
      return bodyList['id'];
    } else {
      throw Exception('Issue with connecting');
    }
  }
}
