import 'package:flutter/material.dart';
import 'package:fluttoon/models/webtoon_detail_model.dart';
import 'package:fluttoon/models/webtoon_episode_model.dart';
import 'package:fluttoon/services/api_service.dart';
import 'package:fluttoon/widgets/episode_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // StatelessWidget에서 하면 안됨 -> webtoon이라는 프로퍼티를 정의할때 다른 프로퍼티인 id에 접근할 수 없기 때문
  // 이걸 해결하려면 일단 DetailScreen을 StatefulWidget으로 변경해야함
  // Future<WebtoonDetailModel> webtoon = ApiService.getToonById(
  //     widget.id); // id 앞에 widget이 붙음 -> widget = 상위 위젯 (DetailScreen) / Stateful로 바꿨을때 refactoring 됨

  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;
  late SharedPreferences prefs;
  bool isLiked = false;

  Future initPrefs() async {
    // 핸드폰 저장소에 선호 웹툰 데이터를 담을때 -> shared_preferences 패키지 사용
    prefs = await SharedPreferences.getInstance(); // -> Instance를 호출하면 저장소와 연결됨
    final likedToons = prefs.getStringList(
        'likedToons'); // 저장소를 검색해서 like 버튼 누른 웹툰들을 불러올거 -> likedToons라는 key를 통해서
    if (likedToons != null) {
      // null이 아니면 리스트에 있는지 확인
      if (likedToons.contains(widget.id) == true) {
        isLiked = true;
        setState(() {}); // initState에서 선언했더라도 refresh를 해줘야 함
      }
    } else {
      // 사용자가 최초로 어플을 실행했을때는 버튼 누른게 없기 때문에 리스트가 아닐 수도 있음
      // null이면 String list를 만들어 줄 거
      await prefs.setStringList('likedToons', []);
    }
  }

  @override
  void initState() {
    super.initState();
    // constructor에서 선언하지 못하기 때문에 initState에서 선언함 / initState는 항상 build보다 먼저 실행되고 한번만 실행되기 때문에
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);
    initPrefs();
  }

  onHeartTap() async {
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      if (isLiked) {
        likedToons.remove(widget.id);
      } else {
        likedToons.add(widget.id);
      }
      await prefs.setStringList('likedToons', likedToons);
      setState(() {
        isLiked = !isLiked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 2, // 그림자의 정도
        surfaceTintColor: Colors.white, // AppBar 오버레이
        shadowColor: Colors.black, // 그림자의 색
        // backgroundColor: Colors.red, // AppBar의 배경
        foregroundColor: Colors.green, // AppBar글자 색
        actions: [
          IconButton(
            onPressed: onHeartTap,
            icon: Icon(
              isLiked ? Icons.favorite : Icons.favorite_outline,
            ),
          ),
        ],
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id,
                    child: Container(
                      width: 250,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            offset: const Offset(10, 10),
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ],
                      ),
                      child: Image.network(
                        widget.thumb,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: webtoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          '${snapshot.data!.genre} / ${snapshot.data!.age}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    );
                  }
                  return const Text('...');
                },
              ),
              const SizedBox(
                height: 50,
              ),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      // 렌더링 할게 적어서 Column으로 충분함 -> 훠어어얼씬 많으면 복잡하더라도 ListView 쓰는게 맞을듯
                      children: [
                        for (var episode in snapshot.data!)
                          Episode(
                            episode: episode,
                            webtoonId: widget.id,
                          )
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
