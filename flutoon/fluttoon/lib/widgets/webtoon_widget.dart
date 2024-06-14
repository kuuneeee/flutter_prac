import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttoon/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 대부분의 동작 감지
      onTap: () {
        // 클릭 -> onTapUp + onTapDown => onTapUp 손가락을 떼는거 onTapDown 손가락이 내려온거(누른거)
        Navigator.push(
            context,
            // MaterialPageRoute(
            //   builder: (context) => DetailScreen(
            //     title: title,
            //     thumb: thumb,
            //     id: id,
            //   ),
            //   // fullscreenDialog: true,
            // ),
            PageRouteBuilder(
              // MaterialPageRoute 보다 다양한 애니메이션 구현가능
              pageBuilder: (context, animation, secondaryAnimation) =>
                  DetailScreen(
                title: title,
                thumb: thumb,
                id: id,
              ),
              transitionsBuilder:
                  // 애니메이션 함수
                  (context, animation, secondaryAnimation, child) {
                var begin = const Offset(1.0, 0.0);
                var end = Offset.zero;
                var curve = Curves.ease;
                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            )); // 입력값 context, route
        // Navigator는 다른 페이지를 띄울때 사용 -> 스크린은 단순한 위젯이 보여지는 거 -> 그래서 그 위에 다른거를 보여주면 페이지가 달라지는거처럼 보임
        // route는 StatelessWidget을 애니메이션 효과를 감싸서 스크린처럼 보이도록 함
      },
      child: Column(
        children: [
          Hero(
            // Hero로 감싸고 같은 tag를 준 두 개의 위젯을 연결해서 페이지가 바뀔때 하나가 움직이는거처럼 만들수 있음
            tag: id,
            child: Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              // 그냥 decoration만 하면 적용안되는 경우가 있음 -> clipbehavior 때문 / clipbehavior는 자식의 부모 영역 침범을 제어하는 방법
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  // 리스트로 들어가야 함
                  BoxShadow(
                    blurRadius: 15,
                    offset: const Offset(10, 10),
                    color: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),
              child: Image.network(
                thumb,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
