import 'dart:async';

import 'package:flutter/material.dart';

/// 25분에 맞춘 간단한 타이머 앱입니다.
/// StatefulWidget 실습용

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

/// totalSeconds: 남은 시간(초). 초기값과 리셋값은 twentyFiveMinutes
/// timer: 1초마다 onTick을 부르는 Timer 객체 (취소용 핸들)
/// isRunning: 실행 중인지 나타내는 flag
/// totalPomodoros: 25분을 다 채운 횟수
///
class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;

  int totalSeconds = twentyFiveMinutes;
  Timer? timer;
  bool isRunning = false;
  int totalPomodoros = 0;
  bool get canReset => isRunning || totalSeconds != twentyFiveMinutes;

  /// 1초마다 호출되어 남은 시간을 줄이는 콜백 (0이 되면 카운트 +1 후 리셋)
  void onTick(Timer timer) {
    if (totalSeconds == 1) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
      });
      resetTimer();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  // 25분이 되거나, 사용자가 임의로 눌렀을 때 시간을 초기화하는 함수
  void resetTimer() {
    timer?.cancel();
    setState(() {
      isRunning = false;
      totalSeconds = twentyFiveMinutes;
    });
  }

  // 시작 버튼이 눌릴 때 작동하는 이벤트 리스너
  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  // 정지 버튼이 눌릴 때 작동하는 이벤트 리스너
  void onPausePressed() {
    timer?.cancel();

    setState(() {
      isRunning = false;
    });
  }

  // 초를 25:00 형태로 만드는 Duration 포매터
  String format(int seconds) {
    var duration = Duration(seconds: seconds);

    return duration.toString().split(".").first.substring(2, 7);
  }

  // 화면에서 사라질 때 호출되는 함수 - 타이머를 정리함
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 배경색은 main.dart에서 내려준 색상을 사용합니다.
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          // Flexible: Row/Column의 남은 공간을 나눠 갖게 하는 위젯
          // 자식들이 flex 비율대로 남은 공간을 나눠 받습니다.
          Flexible(
            flex: 1, // 생략 시 1
            child: Container(
              // 꾸미거나 크기 및 위치를 조정 - 여러 위젯의 기능을 묶은 편의 위젯
              alignment: Alignment.bottomCenter, // 숫자를 아래 붙여 버튼과 가까이 둠
              child: Text(
                format(totalSeconds), // 남은 초를 25:00 형태로 바꿈
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3, // 전체 flex 합(1+3+1=5) 중 3 -> 화면의 3/5
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: IconButton(
                      onPressed: isRunning ? onPausePressed : onStartPressed,
                      icon: Icon(
                        isRunning
                            ? Icons.pause_circle_outline
                            : Icons.play_circle_outline,
                      ),
                      iconSize: 120,
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                  Center(
                    child: IconButton(
                      onPressed: canReset ? resetTimer : null,
                      icon: const Icon(
                        Icons.restart_alt_rounded,
                      ),
                      iconSize: 60,
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pomodoros",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .color,
                          ),
                        ),
                        Text(
                          '$totalPomodoros',
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:toonflix/screens/home_screen.dart';

// void main() {
//   runApp(const App());
// }

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         // 전체 배경화면
//         scaffoldBackgroundColor: const Color(0xFFE7626C),
//         textTheme: const TextTheme(
//           displayLarge: TextStyle(
//             color: Color(0xFF232B55), // 큰 글자 색상
//           ),
//         ),
//         cardColor: const Color(0xFFF4EDDB), // 카드 배경색
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }
