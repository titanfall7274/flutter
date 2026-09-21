import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,

        surfaceTintColor: Colors.white,
        foregroundColor: Colors.green,

        centerTitle: true,
        title: const Text(
          "웹툰",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),

        elevation: 1,
        shadowColor: Colors.black,
      ),

      // future에 넣은 타입에 따라 FutureBuilder<List<WebtoonModel>>로 추론
      body: FutureBuilder(
        future: webtoons,
        // snapshot is AsyncSnapshot<List<WebtoonModel>>
        // 리스트가 아니며, 비동기 작업의 현재 상태를 담은 스냅샷 한 개다.
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // ListView.builder , ListView.separated
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: makeList(snapshot),
                ),
              ],
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  // 반환한 ListView는 Column의 Expanded 안에 들어감
  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      // 리스트가 화면 양 끝에 붙어서 렌더링되는 걸 해결함
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),

      // 스크롤 방향을 가로로 설정
      scrollDirection: Axis.horizontal,

      // snapshot.data는 nullable이라 !로 null이 아님을 단정해 줌
      itemCount: snapshot.data!.length,

      // index를 받아 그 자리의 위젯을 만들어 돌려주는 공장 - lazy building
      // 화면에 보이는 것 + 앞뒤 여유분만 생성
      itemBuilder: (context, index) {
        print(index);
        var webtoon = snapshot.data![index];
        return Webtoon(
          id: webtoon.id,
          title: webtoon.title,
          thumb: webtoon.thumb,
        );
      },

      // 항목 사이의 간격 조절(첫 항목 앞, 마지막 뒤 제외) - lazy building
      // itemBuilder로 만든 항목들 사이사이에 끼워 넣음
      separatorBuilder: (context, index) => const SizedBox(
        width: 40, // 40px
      ),
    );
  }
}
