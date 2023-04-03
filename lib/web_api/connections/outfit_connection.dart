
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:outfit_flutter/web_api/services/api_service.dart';
import 'dart:convert';
import '../const_database.dart';
import '../dto/outfit_dto.dart';

class OutfitConnection {
  final apiService = GetIt.I<ApiService>();

  Future<List<OutfitDto>> getOutfits() async {
    final Response response = await apiService.get(ConstDatabase.outfitUrl);

    if(response.statusCode == 404) {
      throw Exception('Failed load');
    } else {
      final body = json.decode(response.body);
      return body.map( (outfit) => OutfitDto.fromJson(outfit));
    }
  }
}