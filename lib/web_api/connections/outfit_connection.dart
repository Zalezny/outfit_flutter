import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:outfit_flutter/web_api/services/api_service.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import '../const_database.dart';
import '../dto/outfit_list_dto.dart';

@lazySingleton
class OutfitConnection {
  final apiService = GetIt.I<ApiService>();

  Future<OutfitListDto> getOutfits() async {
    final Response response = await apiService.get(ConstDatabase.outfitUrl);

    if (response.statusCode == 404) {
      throw Exception('Failed load');
    } else {
      final body = json.decode(response.body);
      return OutfitListDto.fromJson(body);
    }
  }

  Future<int> postOutfit(String text) async {
    String formattedTime = DateFormat('HH:mm:ss').format(DateTime.now());
    final Map<String, dynamic> bodyText = {
      "title": text,
      "date": formattedTime,
    };
    final Response response = await apiService.post(ConstDatabase.toPostOutfitUrl, jsonEncode(bodyText));

    return response.statusCode;
  }

  Future<int> deleteOutfit(String id) async {
    final uri = "${ConstDatabase.outfitUrl}$id";
    final Response response = await apiService.delete(uri);

    return response.statusCode;
  }

  Future<int> patchEndedById(String id, bool value) async {
    final uri = "${ConstDatabase.outfitUrl}$id";
    final Map<String, dynamic> bodyText = {"ended": value.toString()};

    final Response response = await apiService.patch(uri, jsonEncode(bodyText));

    return response.statusCode;
  }
}
