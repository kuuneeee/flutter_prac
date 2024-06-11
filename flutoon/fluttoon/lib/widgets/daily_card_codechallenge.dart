import 'package:flutter/material.dart';

class daily_card extends StatelessWidget {
  final List<String> time;
  final List<String> texts;
  final List<String> names;
  final Color bgcolor;
  final offset_count = -5.0;

  const daily_card({
    super.key,
    required this.time,
    required this.texts,
    required this.names,
    required this.bgcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgcolor,
        borderRadius: BorderRadius.circular(45),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 15,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          time[0],
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, offset_count),
                          child: Text(
                            time[1],
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, offset_count * 2),
                          child: const Text(
                            "|",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, offset_count * 3),
                          child: Text(
                            time[2],
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, offset_count * 4),
                          child: Text(
                            time[3],
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Transform.translate(
                          offset: const Offset(0, 12),
                          child: Text(
                            texts[0].toUpperCase(),
                            style: const TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(0, -23),
                          child: Text(
                            texts[1].toUpperCase(),
                            style: const TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(0, -15),
                          child: Row(
                            children: [
                              Text(
                                names[0].toUpperCase(),
                                style: TextStyle(
                                  color: names[0].toUpperCase() == 'ME'
                                      ? Colors.black
                                      : Colors.black.withOpacity(0.4),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Text(
                                names[1].toUpperCase(),
                                style: TextStyle(
                                  color: names[1].toUpperCase() == 'ME'
                                      ? Colors.black
                                      : Colors.black.withOpacity(0.4),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Text(
                                names[2].toUpperCase(),
                                style: TextStyle(
                                  color: names[2].toUpperCase() == 'ME'
                                      ? Colors.black
                                      : Colors.black.withOpacity(0.4),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Text(
                                names.length > 3 ? '+${names.length - 3}' : ' ',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.4),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
