import 'package:flutter/material.dart';
import 'package:toonflix/widgets/Button.dart';
import 'package:toonflix/widgets/currency_card.dart';

class Player {
  String? name; // null or realName

  // {}를 붙일경우 생성자로 파라미터를 넘기기는 불가능해진다.
  // namedParameter 방식을 사용해야한다.
  Player({required this.name});
  // Player();
}

// void main() {
//   var player = Player(name: "jiho");
//   player.name; // jiho
//   runApp(const App());
// }

/// coreWidget 3개중 하나를 상속받아야함
/// 1. StatelessWidget
///  해당 메서드는 반드시 build라는 함수를 @override 해야함
/// @protected
/// Widget build(BuildContext buildContext);
class App extends StatelessWidget {
  const App({super.key});

  /// build라는 메서드는 Widget을 반환하는데 무엇을 반환하던
  /// 플러터는 그것을 화면에 그리게된다.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(
          0xFF181818,
        ), // .shade*를 사용하여 추가적인 색상 설정이 가능합니다.
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20), //
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // List<Widget> children
              children: [
                // 가장 상단에 SizedBox를 만들어 Row가 잘리지 않도록 공간을 만든다.
                const SizedBox(
                  height: 40,
                ),

                // =_ <-> Hey,Selen(상단), Welcome back(하단)을 사용합니다.
                Row(
                  // 왼쪽에 빈 공간, 오른쪽에 Column
                  mainAxisAlignment: MainAxisAlignment.end, // row
                  // List<Widget> children
                  children: [
                    Column(
                      // 두 Text의 오른쪽 끝을 맞춤 (css의 flexbox를 생각하면 편하다)
                      crossAxisAlignment: CrossAxisAlignment.end, // row
                      children: [
                        const Text(
                          "Hey, Selena",
                          style: TextStyle(
                            color: Colors.white, // Color? color
                            fontSize: 24, // double? fontSize
                            fontWeight:
                                FontWeight.w800, // FontWeight? fontWeight
                          ),
                        ),
                        Text(
                          "Welcome back",
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.8), // 투명도
                            fontSize: 14,
                          ),
                        ),
                        const CurrencyCard(
                          name: "Euro",
                          code: "EUC",
                          amount: "6 194",
                          icon: Icons.attach_money_outlined,
                          isInverted: false,
                          order: 0,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),

                Text(
                  "Total Balance",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "\$5 194 482",
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // const Color(0xFFF1B33B)
                    Button(
                      text: "Transfer",
                      bgColor: Color(0xfff1b33b),
                      textColor: Colors.black,
                    ),
                    // const Color(0xFF1F2123)
                    Button(
                      text: "Request",
                      bgColor: Color(0xFF1F2123),
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Wallets",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.8),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CurrencyCard(
                  name: "Euro",
                  code: "EUC",
                  amount: "6 194",
                  icon: Icons.euro_rounded,
                  isInverted: false,
                  order: 0,
                ),
                const CurrencyCard(
                  name: "Bitcoin",
                  code: "BTC",
                  amount: "9 785",
                  icon: Icons.currency_bitcoin,
                  isInverted: true,
                  order: -20,
                ),
                const CurrencyCard(
                  name: "Rupee",
                  code: "INR",
                  amount: "28 981",
                  icon: Icons.currency_rupee,
                  isInverted: false,
                  order: -40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
