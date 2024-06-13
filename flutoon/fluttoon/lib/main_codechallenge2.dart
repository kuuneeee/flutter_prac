import 'package:flutter/material.dart';
import 'package:fluttoon/screens/pomotimer.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color(0xFFe64d3d),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFFf19387),
          ),
        ),
        cardColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Color(0xFFbf3a2b),
        ),
      ),
      home: const PomoTimer(),
    );
  }
}
