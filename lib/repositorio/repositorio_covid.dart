import 'dart:convert';
import 'dart:io';
import 'package:desafioteste/model/dados_covid.dart';
import 'package:http/http.dart' as http;

class CovidRepository {
  static Future<List<CovidModel>> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse(
            "https://api.brasil.io/v1/dataset/covid19/caso/data/?search=&da"),
        headers: {
          HttpHeaders.authorizationHeader:
              'Token 8b34c604f8c467c5950550f6870bde20dc5229fb',
        },
      );
      final responseJson = jsonDecode(response.body);
      final jsonResults = responseJson['results'];
      return List.from(jsonResults)
          .map((json) => CovidModel.fromJson(json))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
