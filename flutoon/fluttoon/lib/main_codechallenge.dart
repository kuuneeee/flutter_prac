import 'package:flutter/material.dart';
import 'package:fluttoon/widgets/daily_card_codechallenge.dart';
import 'package:fluttoon/widgets/day_text_codechallenge.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF1f1f1f),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 80,
              horizontal: 15,
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.person_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 40,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "MONDAY 16",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -15),
                      child: const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: day_text(),
                      ),
                    ),
                  ],
                ),
                const Column(
                  children: [
                    daily_card(
                      time: ['11', '30', '12', '20'],
                      texts: ['DESIGN', 'MEETING'],
                      names: ['ALEX', 'helena', 'nana'],
                      bgcolor: Color(0xFFFEF754),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    daily_card(time: [
                      '12',
                      '35',
                      '14',
                      '10'
                    ], texts: [
                      'daily',
                      'project'
                    ], names: [
                      'me',
                      'richard',
                      'ciry',
                      'a',
                      'a',
                      'a',
                      'a',
                    ], bgcolor: Color(0xFF9C6BCE)),
                    SizedBox(
                      height: 10,
                    ),
                    daily_card(
                        time: ['15', '00', '16', '30'],
                        texts: ['weekly', 'planning'],
                        names: ['den', 'nana', 'mark'],
                        bgcolor: Color(0xFFbcee4b)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
