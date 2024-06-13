import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PomoCard extends StatefulWidget {
  final String text;

  const PomoCard({
    super.key,
    required this.text,
  });

  @override
  State<PomoCard> createState() => _PomoCardState();
}

class _PomoCardState extends State<PomoCard> {
  final _radius = 5.0;

  final _opacity = 0.7;

  void timer() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
              widget.text,
              style: TextStyle(
                color: Theme.of(context).colorScheme.background,
                fontSize: 90,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
