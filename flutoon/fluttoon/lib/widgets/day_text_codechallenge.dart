import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class day_text extends StatelessWidget {
  final double _width = 15.0;

  const day_text({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "12",
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 45,
          ),
        ),
        SizedBox(
          width: _width,
        ),
        Text(
          "13",
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 45,
          ),
        ),
        SizedBox(
          width: _width,
        ),
        Text(
          "14",
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 45,
          ),
        ),
        SizedBox(
          width: _width,
        ),
        Text(
          "15",
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 45,
          ),
        ),
        const Text(
          "·",
          style: TextStyle(
            color: Color(0xFFb22580),
            fontSize: 74,
          ),
        ),
        const Text(
          "TODAY",
          style: TextStyle(
            color: Colors.white,
            fontSize: 45,
          ),
        ),
        const Text(
          "·",
          style: TextStyle(
            color: Color(0xFFb22580),
            fontSize: 74,
          ),
        ),
        Text(
          "17",
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 45,
          ),
        ),
        SizedBox(
          width: _width,
        ),
        Text(
          "18",
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 45,
          ),
        ),
        SizedBox(
          width: _width,
        ),
        Text(
          "19",
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 45,
          ),
        ),
        SizedBox(
          width: _width,
        ),
        Text(
          "20",
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 45,
          ),
        ),
        SizedBox(
          width: _width,
        ),
        Text(
          "21",
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 45,
          ),
        ),
        SizedBox(
          width: _width,
        ),
        Text(
          "22",
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 45,
          ),
        ),
      ],
    );
  }
}
