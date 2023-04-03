import 'package:outfit_flutter/web_api/const_database.dart';
import 'package:http/http.dart' as http;


class ApiService {
  Map<String, String> headers = {
    'authorization': ConstDatabase.outfitKey,
  };

  Future<http.Response> get(String uri) async {
    return http.get(
      Uri.parse(uri),
      headers: headers,
    );
  }
}