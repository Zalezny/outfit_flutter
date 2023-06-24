import 'package:injectable/injectable.dart';
import 'package:outfit_flutter/web_api/const_database.dart';
import 'package:http/http.dart' as http;

@lazySingleton
class ApiService {
  Map<String, String> defaultHeaders = {
    'authorization': ConstDatabase.outfitKey,
  };

  Future<http.Response> get(String uri) async {
    return http.get(
      Uri.parse(uri),
      headers: defaultHeaders,
    );
  }

  Future<http.Response> delete(String uri) async {
    return http.delete(
      Uri.parse(uri),
      headers: defaultHeaders
    );
  }

  Future<http.Response> post(String uri, Map<String,dynamic> body) async {
    return http.post(
      Uri.parse(uri),
      headers: defaultHeaders,
      body: body
    );
  }
}