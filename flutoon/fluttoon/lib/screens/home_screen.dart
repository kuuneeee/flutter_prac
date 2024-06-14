import 'package:flutter/material.dart';
import 'package:fluttoon/models/webtoon_model.dart';
import 'package:fluttoon/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key}); // Future 타입이 있기 때문에 클래스가 const가 될 수 없음

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    // 어떻게 Future를 기다릴 수 있을까? 또, 그걸 Future의 로딩 상태를 build에 바로 반영할 수 있을까?
    // print(webtoons); // Future를 그대로 반환함
    // FutureBuilder를 사용하자!!
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 2, // 그림자의 정도
        surfaceTintColor: Colors.white, // AppBar 오버레이
        shadowColor: Colors.black, // 그림자의 색
        // backgroundColor: Colors.red, // AppBar의 배경
        foregroundColor: Colors.green, // AppBar글자 색
        title: const Text(
          '오늘의 웹툰',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons, // FutureBuilder가 이 부분에 await를 걸어줄거임
        builder: (context, snapshot) {
          // sanpshot을 이용하면 Future의 상태를 알 수 있음
          // snapshot.data -> 데이터를 받았는지
          // snapshot.error -> 에러가 났는지
          // snapshot.connectionState -> 연결상태는 어떤지
          if (snapshot.hasData) {
            return const Text("There is data!!");
          }
          return const Text('Loading...');
        },
      ),
    );
  }
}
