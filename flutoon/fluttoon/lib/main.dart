import 'package:flutter/material.dart';
import 'package:fluttoon/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  // 위젯의 키를 수퍼클래스에 보낸거 -> 이 경우 StatelessWidget
  // 위젯은 id 같은 key가 있다는 거 -> Flutter가 위젯을 빠르게 찾을 수 있게끔 함
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
