import 'package:flutter/material.dart';
import 'package:minifeed/theme/app_theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("미니피드"),
          centerTitle: true,
        ),
      ),
    );
  }
}
