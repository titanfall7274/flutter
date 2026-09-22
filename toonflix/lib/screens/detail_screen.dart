import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/episode_widget.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  // StatelessWidget에서 StatefulWidget으로 바꾼 이유:
  // 필드 초기화 식에서는 this에 접근할 수 없어 ApiService에 id를 넘길 수 없다.
  // initState()는 위젯이 만들어진 뒤 한 번만 호출되므로 widget.id를 쓸 수 있다.
  @override
  void initState() {
    super.initState();
    // 접근이 가능할 때만 해당 id를 참조하여 비동기 작업을 호출

    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestyEpisodes(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,

        surfaceTintColor: Colors.white,

        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),

        elevation: 1,
        shadowColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: widget.id,
                  child: Container(
                    width: 220,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 15,
                          offset: const Offset(10, 15),
                          color: Colors.black.withValues(alpha: 0.5),
                        ),
                      ],
                    ),
                    child: Image.network(
                      headers: const {
                        "Referer": "https://comic.naver.com",
                      },
                      widget.thumb,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            FutureBuilder(
              future: webtoon,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${snapshot.data!.genre} / ${snapshot.data!.age}',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return const Text("..."); // 데이터가 없을 경우 (불러오는 경우를 포함)
              },
            ),
            const SizedBox(
              height: 15,
            ),
            FutureBuilder(
              // 에피소드 (ex> 몇 화)
              future: episodes, // 풀로딩
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      const Divider(
                        height: 2,
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      for (var episode in snapshot.data!)
                        Episode(episode: episode, webtoonId: widget.id),
                    ],
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
