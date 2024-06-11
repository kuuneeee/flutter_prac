import 'package:flutter/material.dart'; // 어떤 스타일인지에 따라 달라질수 있음

class Button extends StatelessWidget {
  // 재사용할 수 있는 Widget
  // code action 사용해서 만들 수도 있음
  final String text;
  final Color bgColor;
  final Color textColor;

  const Button({
    super.key,
    required this.text,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(45),
      ),
      child: Padding(
        // 원래는 여기에 const가 있었음 -> const는 미리 알고 있는 상수였을때 사용
        // -> Padding의 child에 입력받는 text, textColor가 미리 설정된 상수가 아니기 때문에 const를 삭제
        padding: const EdgeInsets.symmetric(
          // 대신 여기는 상수니깐 여기만 const로 변경
          vertical: 20,
          horizontal: 50,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
