import 'package:flutter/material.dart';
import 'package:fluttoon/models/webtoon_model.dart';
import 'package:fluttoon/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key}); // Future 타입이 있기 때문에 클래스가 const가 될 수 없음

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

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
            // return ListView(
            //   // 많은 양의 데이터를 연속적으로 보여주고 싶을때 Column이나 Row로는 힘듦 -> ListVew 사용
            //   // 여러 항목을 나열하는데 최적화된 위젯 / 버전이 많음
            //   children: [
            //     for (var webtoon in snapshot.data!) Text(webtoon.title) // 간단한 예제 -> 이렇게 하면 데이터를 다 로딩함 (메모리 부족할 것)
            //   ],
            // );
            // return ListView.builder(
            //   scrollDirection: Axis.horizontal, // 스크롤 방향
            //   itemCount: snapshot.data!.length, // dart가 몇개의 아이템을 빌드할지 지정
            //   itemBuilder: (context, index) {
            //     // FutureBuilder의 builder랑 유사하지만 index를 사용함
            //     // 이 index로 어떤 아이템이 build되는지 알 수 있음
            //     // ListView.builder는 사용자가 보고 있는 아이템만 build할 거 -> 안 보고 있는 것들은 메모리에서 삭제
            //     var webtoon = snapshot.data![index];
            //     print(index);
            //     return Text(webtoon.title);
            //   },
            // );
            return ListView.separated(
              scrollDirection: Axis.horizontal, // 스크롤 방향
              itemCount: snapshot.data!.length, // dart가 몇개의 아이템을 빌드할지 지정
              itemBuilder: (context, index) {
                // FutureBuilder의 builder랑 유사하지만 index를 사용함
                // 이 index로 어떤 아이템이 build되는지 알 수 있음
                // ListView.builder는 사용자가 보고 있는 아이템만 build할 거 -> 안 보고 있는 것들은 메모리에서 삭제
                var webtoon = snapshot.data![index];
                print(index);
                return Text(webtoon.title);
              },
              separatorBuilder: (context, index) => const SizedBox(
                // ListView.separated -> 아이템 간의 분할된 View를 보여줌
                width: 20,
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
