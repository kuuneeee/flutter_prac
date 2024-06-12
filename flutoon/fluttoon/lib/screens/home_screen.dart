import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  // 1500을 실수하지 않게 명확하게 하기 위해서 const로 지정한 걸 넘겨주자 -> 1500을 복사할 때 실수할까봐
  int totalseconds = twentyFiveMinutes;
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalseconds == 0) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        isRunning = false;
        totalseconds = twentyFiveMinutes;
      });
      timer.cancel();
    } else {
      setState(() {
        totalseconds = totalseconds - 1;
      });
    }
  }

  void onStartPressed() {
    // Timer는 dart 기본 패키지
    // Timer.periodic은 주기마다 함수를 실행하게끔
    timer = Timer.periodic(
      const Duration(seconds: 1), // 이 주기마다
      onTick, // 이 함수를 실행
      // The argument type 'void Function()' can't be assigned to the parameter type 'void Function(Timer)'.  -> Timer.periodic이 실행하는 함수는 그 인자로 Timer 자체를 받음
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressd() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split('.').first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            // 하드 코딩되는 값을 만들게 해줌
            // 딱 정해져 있는 값이 아니라 UI를 비율에 기반해서 더 유연하게 만들 수 있게 해줌
            flex: 1, // Flexible의 비율 -> 서로 간의 크기를 비교해서 얼마나 커야 하는지
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalseconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              child: Center(
                child: IconButton(
                  onPressed: isRunning
                      ? onPausePressd
                      : onStartPressed, // () {} 는 아무것도 안하는 함수
                  color: Theme.of(context).cardColor,
                  iconSize: 120,
                  icon: Icon(
                    isRunning
                        ? Icons.pause_circle_outline
                        : Icons.play_circle_outline,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  // 화면 끝까지 Row를 확장하는 위젯
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge?.color,
                          ),
                        ),
                        Text(
                          '$totalPomodoros',
                          style: TextStyle(
                            fontSize: 58,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge?.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
