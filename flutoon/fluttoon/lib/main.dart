import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

// flutter는 수많은 Widget으로 구성되어 있음
// Widget은 레고 블럭 같은 개념 -> 레고 블럭 여러개를 사용해서 완성
// Widget은 남들이 만든걸 사용할 수도 있고, 내가 직접 만들수도 있음
// flutter widget 카탈로그 사이트에 가보면 여러 Widget을 볼 수 있음 -> 다 기억할 필요는 없고 찾아보면 됨

// class App인 상태에서는 단순히 클래스일뿐
// 이걸 Widget으로 만들기 위해서는 flutter SDK에 있는 3개의 core Widget 중에 하나를 extend해야 함
// 가장 기초적이고 쉬운 건 StatelessWidget

class App extends StatelessWidget {
  // 이렇게 하면 App은 Widget이 됨
  // 하지만 build 메서드를 만들지 않아서 App에 에러가 발생 -> StatelessWidget을 extend해서 사용하려면 build 메서드를 구현해야 한다는 것

  // build 메서드
  // build 메서드는 뭘 return하던지 화면에 보여주는 메서드임 -> Widget의 UI를 만드는 거
  // 밑의 @overide는 부모 클래스(StatelessWidget)의 build 메서드를 overide한다는 거
  @override
  Widget build(BuildContext context) {
    // build는 Widget을 return해줘야 함 -> 어떤 Widget?? => 구글 : material / 애플 : cupertino
    // App Widget은 runApp 함수에 전달되는 Widget -> 즉, 모든 작업의 root가 되는 Widget이라는 것
    // material과 cupertino는 각각 구글과 애플의 디자인 시스템
    // MaterialApp, CupertinoApp 중 하나를 return하는 데, 이건 우리가 어떤 family 스타일을 사용할지를 flutter한테 말해주는 거 -> 어떤 스타일로 보여지게 할건지

    return MaterialApp(
      // // home
      // home: Text("Hello World!!"), // home 화면에 어떤걸 띄울지

      // // 단순히 이렇게만 하면 겁나 이상하게 나올 거
      // // flutter의 scaffold를 고려하지 않아서임 -> scaffold는 공사장에서 사용하는 겹겹이 쌓인 발판(비계) 같은 거 => 즉, 화면 구조가 층층이 구성된다는 거
      // // 모바일 앱의 모든 화면은 scaffold가 필요함 -> navigation bar, bottom tab bar, 상단 버튼, 화면 중앙 정렬 등등

      home: Scaffold(
        appBar: AppBar(
          // Title 달수 있는 Widget
          title: Text("Hello Flutter!!"),
        ),
        body: Center(
          // child를 화면 가운데에 배치하는 Widget
          child: Text("Hello World!!"),
        ),
      ),
    );
  }
}
