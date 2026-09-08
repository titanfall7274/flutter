import 'package:flutter/material.dart';

class Player {
  String? name; // null or realName

  // {}를 붙일경우 생성자로 파라미터를 넘기기는 불가능해진다.
  // namedParameter 방식을 사용해야한다.
  Player({required this.name});
  // Player();
}

void main() {
  var player = Player(name: "jiho");
  player.name; // jiho
  runApp(App());
}

/**
 * coreWidget 3개중 하나를 상속받아야함 
 * 1. StatelessWidget
 *  해당 메서드는 반드시 build라는 함수를 @override 해야함
 * @protected 
 * Widget build(BuildContext buildContext);
 */
class App extends StatelessWidget {
  /**
   * build라는 메서드는 Widget을 반환하는데 무엇을 반환하던 
   * 플러터는 그것을 화면에 그리게된다.
   */

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 10, // appBar 하단의 shadow 강도 0 ~ n
          centerTitle: false, // 중앙정렬이 풀리고 왼쪽 정렬이됨
          title: Text("Hello flutter"),
        ),
        body: Center(
          child: Text("Hello World!"),
        ),
      ),
    );
  }
}
