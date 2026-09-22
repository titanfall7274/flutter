import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
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
  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);

      return WebtoonDetailModel.fromJson(webtoon);
    } else {
      throw Error();
    }
  }

  // /:id/episodes
  static Future<List<WebtoonEpisodeModel>> getLatestyEpisodes(String id) async {
    List<WebtoonEpisodeModel> webtoonEpisodes = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        webtoonEpisodes.add(WebtoonEpisodeModel.fromJson(episode));
      }

      return webtoonEpisodes;
    } else {
      throw Error();
    }
  }
}
