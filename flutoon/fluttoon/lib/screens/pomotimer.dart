import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

class PomoTimer extends StatefulWidget {
  const PomoTimer({super.key});

  @override
  State<PomoTimer> createState() => _PomoTimerState();
}

class _PomoTimerState extends State<PomoTimer> {
  final _radius = 5.0;
  final _opacity = 0.7;
  final int _before = 0;

  static const defaultTime = 10;
  static const defaultRest = 3;
  static const totalRound = 2;
  static const totalGoal = 3;
  static const pomo = 'pomo';
  static const rest = 'rest';
  int pomoTime = defaultTime;
  int restTime = defaultRest;
  String state = pomo;
  int round = 0;
  int goal = 0;

  int totalTime = defaultTime;
  bool isSelectedTime = false;
  bool isRunning = false;

  late Timer timer;
  late Timer restTimer;

  void setTime(int time) {
    setState(() {
      pomoTime = time;
      totalTime = pomoTime * 1;
    });
  }

  void onTick(Timer timer) {
    if (totalTime == 0) {
      restTimer = Timer.periodic(const Duration(seconds: 1), onRest);
      setState(() {
        round = round + 1;
        isRunning = false;
        state = rest;
        totalTime = restTime;
        // totalTime = pomoTime * 1;
      });
      timer.cancel();
    } else {
      setState(() {
        totalTime = totalTime - 1;
      });
    }

    if (round == totalRound) {
      goal = goal + 1;
      round = 0;
    }
  }

  void onRest(Timer timer) {
    if (restTime == 0) {
      restTimer.cancel();
      setState(() {
        restTime = defaultRest;
        totalTime = pomoTime;
        state = pomo;
        isRunning = false;
      });
    } else {
      setState(() {
        restTime = restTime - 1;
        totalTime = restTime;
      });
    }
  }

  void onStartPressed() {
    if (state == pomo) {
      timer = Timer.periodic(
        const Duration(seconds: 1),
        onTick,
      );
    } else if (state == rest) {
      timer = Timer.periodic(
        const Duration(seconds: 1),
        onRest,
      );
    }
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

  void onReset() {
    if (isRunning && timer.isActive) {
      timer.cancel();
    } else if (isRunning && restTimer.isActive) {
      restTimer.cancel();
    }
    setState(() {
      isRunning = false;
      pomoTime = defaultTime;
      restTime = defaultRest;
      round = 0;
      goal = 0;
      state = pomo;
      totalTime = pomoTime * 1;
    });
  }

  List<String> format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split('.').first.substring(2, 7).split(':');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Flexible(
              flex: 0,
              child: Container(
                  alignment: Alignment.bottomLeft,
                  child: const Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      "POMOTIMER",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )),
            ),
            Flexible(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.translate(
                          offset: const Offset(0, 71),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(_opacity),
                              borderRadius: BorderRadius.circular(_radius),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 60,
                                vertical: 10,
                              ),
                              child: Text(''),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(0, 35),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(_opacity),
                              borderRadius: BorderRadius.circular(_radius),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 67,
                                vertical: 10,
                              ),
                              child: Text(''),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(_radius),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 32,
                            ),
                            child: Text(
                              format(totalTime)[0],
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.background,
                                fontSize: 90,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Transform.translate(
                      offset: const Offset(0, 36),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            ':',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color,
                              fontSize: 60,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.translate(
                          offset: const Offset(0, 71),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(_opacity),
                              borderRadius: BorderRadius.circular(_radius),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 60,
                                vertical: 10,
                              ),
                              child: Text(''),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(0, 35),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(_opacity),
                              borderRadius: BorderRadius.circular(_radius),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 67,
                                vertical: 10,
                              ),
                              child: Text(''),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(_radius),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 32,
                            ),
                            child: Text(
                              format(totalTime)[1],
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.background,
                                fontSize: 90,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      selectTimeButton(
                        time: 1,
                        func: setTime,
                        before: _before,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      selectTimeButton(
                        time: 2,
                        func: setTime,
                        before: _before,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      selectTimeButton(
                        time: 3,
                        func: setTime,
                        before: _before,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      selectTimeButton(
                        time: 4,
                        func: setTime,
                        before: _before,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      selectTimeButton(
                        time: 5,
                        func: setTime,
                        before: _before,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      selectTimeButton(
                        time: 6,
                        func: setTime,
                        before: _before,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      selectTimeButton(
                        time: 7,
                        func: setTime,
                        before: _before,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).iconTheme.color,
                        borderRadius: BorderRadius.circular(45),
                      ),
                      child: IconButton(
                        onPressed: isRunning ? onPausePressd : onStartPressed,
                        iconSize: 58,
                        color: Theme.of(context).cardColor,
                        icon: Icon(
                          isRunning ? Icons.pause : Icons.play_arrow,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: IconButton(
                      iconSize: 35,
                      onPressed: onReset,
                      icon: const Icon(
                        Icons.restore,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      state,
                      style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$round/$totalRound',
                          style: TextStyle(
                            color: Theme.of(context).cardColor.withOpacity(0.5),
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          'ROUND',
                          style: TextStyle(
                            color: Theme.of(context).cardColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$goal/$totalGoal',
                          style: TextStyle(
                            color: Theme.of(context).cardColor.withOpacity(0.5),
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          'GOAL',
                          style: TextStyle(
                            color: Theme.of(context).cardColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
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
    );
  }
}

class selectTimeButton extends StatelessWidget {
  final int time;
  final void Function(int minute) func;
  final int before;

  const selectTimeButton({
    super.key,
    required this.time,
    required this.func,
    required this.before,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        func(time);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 7,
        ),
        decoration: BoxDecoration(
          color: (before == time)
              ? Theme.of(context).cardColor
              : Theme.of(context).colorScheme.background,
          border: Border.all(
            color: Theme.of(context).cardColor.withOpacity(0.8),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          '$time',
          style: TextStyle(
            color: Theme.of(context).cardColor,
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
