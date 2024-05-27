import 'dart:convert';

import 'package:google_search_clone/config/api_json.dart';
import 'package:google_search_clone/config/api_keys.dart';
import 'package:http/http.dart';

class ApiService {
  bool isDummyData = true;
  Future<Map<String, dynamic>> fetchData(
      {required String query, String start = "0"}) async {
    try {
      if (!isDummyData) {
        String q = query.replaceAll(' ', '%20');
        final Response response = await get(
          Uri.parse(
              "https://www.googleapis.com/customsearch/v1?key=$apiKey&cx=$contextKey&q=$q&start=$start"),
        );
        if (response.statusCode == 200) {
          final jsonData = response.body;
          final respData = jsonDecode(jsonData);
          return respData;
        } else {
          throw Exception('Failed to load data');
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return apiResponse;
  }
}
