import 'package:flutter/material.dart';
import 'package:fluttoon/models/webtoon_model.dart';
import 'package:fluttoon/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // HomeScreen의 State 지정하는 위젯
  List<WebtoonModel> webtoons = [];
  bool isLoading = true;

  void waitForWebtToons() async {
    webtoons = await ApiService.getTodaysToons();
    // ApiService의 getTodaysToons 함수는 async 함수 -> 데이터를 불러오면 그떄 webtoons에 넣게되고 List<WebtoonModel> 타입이 됨
    isLoading = false;

    setState(() {});
  }

  @override
  void initState() {
    super.initState(); // 초기화
    waitForWebtToons(); // 불러온 데이터로 다시 초기화
  }

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    print(isLoading);

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
    );
  }
}
