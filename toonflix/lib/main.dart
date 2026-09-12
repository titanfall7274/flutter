import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';

void main() {
  // https://webtoon-crawler.nomadcoders.workers.dev/today
  // ApiService().getTodaysToons();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      home: HomeScreen(),
    );
  }
}
