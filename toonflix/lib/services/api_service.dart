import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";

  // /today
  static const String today = "today";

  // http package , pub.dev 에서 다운로드 https://pub.dev/packages/http
  // dart pub add http // flutter pub add http
  // dependencies:
  // http: ^1.6.0
  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(
      url,
    ); // return Future<Response> async - await

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(
        response.body,
      ); // dynamic could be anything
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }

      return webtoonInstances;
    } else {
      throw Error();
    }
  }

  // /:id

  // /:id/episodes
}
