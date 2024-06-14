import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttoon/screens/home_screen.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  // 403 Error
  // 따로 User-Agent 값을 추가하지 않으면 기본값으로 'Dart/<version> (dart:io)'가 입력됨
  // 이 값을 지우고 브라우저에서 사용하는 값으로 바꿔야 됨
  // 브라우저 값이 아니면 네이버에서 차단하는걸로 보여짐

  runApp(const App());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..userAgent =
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36';
  }
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
