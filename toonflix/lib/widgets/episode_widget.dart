import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Episode extends StatelessWidget {
  final String webtoonId;
  final WebtoonEpisodeModel episode;

  const new({
    super.key,
    required this.episode,
    required this.webtoonId,
  });

  Future<void> onButtonTap() async {
    // final url = Uri.parse("https://google.com");
    await launchUrlString(
      "https://comic.naver.com/webtoon/detail?titleId=P=$webtoonId&no=${episode.id}&week=tue",
    ); // import 필요

    // titleId 고정, no = 회차
    // 176화 urlString: https://comic.naver.com/webtoon/detail?titleId=784248&no=179&week=tue
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 100,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Image.network(
                      headers: const {
                        "Referer": "https://comic.naver.com",
                      },
                      episode.thumb,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(episode.title),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 14,
                            color: Colors.grey,
                          ),
                          Text(
                            episode.rating,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            episode.date,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.chevron_right_rounded),
                ],
              ),
              const Divider(
                thickness: 1,
                height: 2,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
