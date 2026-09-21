class WebtoonModel {
  final String title;
  final String thumb;
  final String id;

  // WebtoonModel({
  //   required this.title,
  //   required this.thumb,
  //   required this.id,
  // });

  /// {
  ///  "id":"808389",
  ///  "title":"나 혼자 탑에서 농사",
  ///  "thumb":"https://image-comic.pstatic.net/webtoon/808389/thumbnail/thumbnail_IMAG21_b429c638-a6df-470d-bbb0-7c6dce13813b.jpg"
  /// }, {...}
  WebtoonModel.fromJson(Map<String, dynamic> json)
    : id = json["id"],
      title = json["title"],
      thumb = json["thumb"];
}
