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

  // List<int> numbers = [];

  // void onClicked() {
  //   // 버튼 클릭할 때 실행되는 함수
  //   setState(() {
  //     // State 클래스에게 데이터가 변경되었다고 알리는 함수
  //     // setState는 기본적으로 이 메서드(onClicked)를 한번 더 호출 하는 거 -> 부분만 새로 업데이트하는 것도 되나??
  //     // 이 안에다가 함수를 넣지 않아도 작동함 -> 메서드 안에 존재하기만 하면 됨
  //     numbers.add(numbers.length);
  //   });
  // }

  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // theme은 전체적인 앱의 테마를 정함
        // 지금까지는 하나하나 색상, 크기 등을 정해줬지만 -> 여기서 한번에 적용할 수 있음
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        // 배경색 -> 0xFF 쓰고 컬러코드 or Color.fromARGB(Bright, R,G,B), Color.fromRGBO(R,G,B,Opacity)
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text('Nothing'),
              // MylargeTitle이라는 위젯이 위젯트리에서 삭제되거나 추가되어 실행되거나 할때 dispose 메서드가 실행됨
              IconButton(
                onPressed: toggleTitle,
                icon: const Icon(
                  Icons.remove_red_eye,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    // 상태(state)를 초기화하기 위한 메서드
    // 보통은 프러퍼티를 그냥 초기화하면 됨
    // 가끔 부모요소에 의존하는 데이터를 초기화해야 하는 경우가 있음 -> 데이터를 초기화하기 위해 context를 사용하게 될 것
    // 종종 API에서 업데이트를 구독하고 싶을 때가 있을 것
    // 이럴 때 사용

    // 중요한 점은 initState가 항상 build 메서드보다 먼저 호출되어야 한다는 점
    // 또, initState 메서드는 오직 단 한번만 호출됨
    super.initState();
    print("initState!");
  }

  @override
  void dispose() {
    // 위젯이 스크린에서 제거될 때 호출되는 메서드
    // API 업데이트나 이벤트 리스터로부터 구독을 취소하거나 form의 리스너로부터 벗어나고 싶을 때 사용할 수 있음
    // 즉, 무언가를 취소하는 거
    super.dispose();
    print('dispose!');
  }

  @override
  Widget build(BuildContext context) {
    // App에서 정한 theme을 적용하려면 context를 사용해야 함
    // 위젯 트리 상 App은 root고 MyLargeTitle는 엄청 밑에 child임
    // context는 MyLargeTitle의 parent들의 모든 정보를 담고 있음

    print('build!');

    return Text(
      "My Large Title",
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
        // The property 'color' can't be unconditionally accessed because the receiver can be 'null'. -> 테마로 정한 color가 null 값이 될 수 있으므로 에러
        // Invalid constant value. -> const는 안된대 -> 삭제
      ),
    );
  }
}
