import 'package:flutter/material.dart';
import 'package:fluttoon/widgets/button.dart';
import 'package:fluttoon/widgets/currency_card.dart';

void main() {
  runApp(const App());
}

// 지금까지는 stateless widget을 사용했음
// stateless와 stateful은 state를 가지냐 아니냐임
// 상태에 따라 변하게 될 데이터를 생각해보면 됨
// stateless는 그저 UI를 보여주는 것이고, stateful은 변화하는 데이터를 반영해서 UI에 띄우는 거

// StatefullWidget은 두 파트로 이루어짐
// 1. 상태가 없는 위젯 그 자체
// 2. 위젯의 상태(state)로, 위젯에 들어갈 데이터와 UI를 넣는 부분

class App extends StatefulWidget {
  // 파트 1. 상태가 없는 위젯 그 자체
  const App({super.key});

  @override
  State<App> createState() => _AppState(); // state 하나를 가지고 있음
}

class _AppState extends State<App> {
  // 파트 2. UI를 구축하는 곳
  // state의 데이터를 고치면 UI는 새로고침되면서 최신 데이터를 보여줌
  // StatefulWidget의 데이터는 단지 클래스 프로퍼티일 뿐 -> 단순한 Dart 클래스 프로퍼티

  List<int> numbers = [];

  void onClicked() {
    // 버튼 클릭할 때 실행되는 함수
    setState(() {
      // State 클래스에게 데이터가 변경되었다고 알리는 함수
      // setState는 기본적으로 이 메서드(onClicked)를 한번 더 호출 하는 거 -> 부분만 새로 업데이트하는 것도 되나??
      // 이 안에다가 함수를 넣지 않아도 작동함 -> 메서드 안에 존재하기만 하면 됨
      numbers.add(numbers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        // 배경색 -> 0xFF 쓰고 컬러코드 or Color.fromARGB(Bright, R,G,B), Color.fromRGBO(R,G,B,Opacity)
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Click Count",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              for (var n in numbers) // 리스트에서 collectionfor를 써서 이런 식으로 쓸수 있음
                Text(
                  '$n',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              IconButton(
                iconSize: 40,
                onPressed: onClicked, // 클릭할 때마다 실행할 함수
                icon: const Icon(
                  Icons.add_box_rounded,
                ), // 아이콘 모양
              )
            ],
          ),
        ),
      ),
    );
  }
}
