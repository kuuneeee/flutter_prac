import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttoon/widgets/button.dart';

void main() {
  runApp(const App());
}

// flutter는 수많은 Widget으로 구성되어 있음
// Widget은 레고 블럭 같은 개념 -> 레고 블럭 여러개를 사용해서 완성
// Widget은 남들이 만든걸 사용할 수도 있고, 내가 직접 만들수도 있음
// flutter widget 카탈로그 사이트에 가보면 여러 Widget을 볼 수 있음 -> 다 기억할 필요는 없고 찾아보면 됨

// class App인 상태에서는 단순히 클래스일뿐
// 이걸 Widget으로 만들기 위해서는 flutter SDK에 있는 3개의 core Widget 중에 하나를 extend해야 함
// 가장 기초적이고 쉬운 건 StatelessWidget

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        // 배경색 -> 0xFF 쓰고 컬러코드 or Color.fromARGB(Bright, R,G,B), Color.fromRGBO(R,G,B,Opacity)
        body: Padding(
          // 화면 테두리 부분에 padding
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          // all은 상하좌우 모두에 패딩을 주는 거 / only는 상하좌우 선택한데만 패딩 주는거 / symmetric은 상하 또는 좌우에 동시에 패딩 주는거
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // Column은 children이라는 List<Widget>를 받음(child가 아니라) -> Column 방향 배열, Row 방향 배열 배치를 위함
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                // 첫번째 Row
                mainAxisAlignment: MainAxisAlignment.end,
                // Row에서의 mainAxis는 수직방향에서의 정렬 -> start는 왼쪽 끝, end는 오른쪽 끝
                children: [
                  // Row도 children을 가짐
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    // Column에서의 crossAxis는 수직방향에서의 정렬 = Row에서의 mainAxis -> 반대개념
                    children: [
                      const Text(
                        "Hey, Selena",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        "Welcome back",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              Text(
                "Total Balance",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "\$5 194 482",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                      text: "Transfer",
                      bgColor: Color(0xFFF2B33A),
                      textColor: Colors.black),
                  Button(
                    text: "Request",
                    bgColor: Color(0xFF1F2123),
                    textColor: Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "Wallets",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      // withOpacity를 사용할때는 const 변수로 지정되어있으면 안됨 -> Opacity 값을 compile할 때 모르기 때문
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1F2123),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Euro",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Text(
                                "6 428",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "EUR",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
