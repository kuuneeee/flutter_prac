import 'dart:convert';

import 'package:fluttoon/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiServie {
  final String baseurl = "https://webtoon-crawler.nomadcoders.workers.dev/";
  final String today = "today";

  // URL에 요청을 보내기 위해서는 http 패키지가 필요함
  // Flutter나 Dart 패키지를 찾고 싶으면 pub.dev 사이트에서 찾으면 됨 -> 공식 패키지 보관소
  // Node.js의 npm, Python의 PyPI 같은 개념
  // flutter pub add http -> pubspec.yaml까지 같이 만들어줌
  // pubspec.yaml에서 패키지의 버전과 사용법 등등이 써있음

  // get(url);
  // get 함수는 http 패키지에서 불러올 수 있음
  // 입력된 url로 HTTP GET 리퀘스트를 보내는 함수임
  // get 함수는 Future 타입을 반환함 -> Future는 미래에 받을 값의 타입을 알려줌

  Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseurl$today');
    final response = await http.get(url);

    // getTodayToons라는 함수를 실행하면 dart는 위에서 아래로 코드를 읽어가며 실행시킬 거
    // 이 경우에는 url 변수를 지정하고 get 함수를 실행함
    // 근데 get 함수와 같이 서버 문제나 네트워크 문제 등으로 요청한 결과가 나오기까지 시간이 지연되는 경우가 생김
    // 그냥 실행하게 되면 아직 url을 받아오지 못했는데 밑에 있는 코드를 실행하게 되니까 화면에서 꼬이는 경우가 발생
    // 그래서, get 함수로 받아오는 요청이 끝나면 다음 코드로 넘어가게 해야 그런 문제가 발생하지 않을 거
    // 이렇게, 하나의 요청이 끝나고 그 다음으로 넘어가는게 Async Programming (비동기 프로그래밍)
    // dart에서는 await를 써서 해당 함수의 요청이 끝날때까지 비동기를 걸어놓을 수 있음
    // await를 사용할 때 유일한 룰은 asynchronous function에서만 작동한다는 점 -> 함수명 옆에 async 표시
    // 보통 await는 Future 타입과 같이 사용하게 됨 -> Future<Response> : 미래(Future)에 Response 타입을 반환한다는 거

    if (response.statusCode == 200) {
      // response의 statusCode가 200일때 -> 요청이 성공했을때
      // print(response.body);
      // response의 body를 출력 -> 서버가 보낸 데이터

      // 이제 서버에서 가져온 데이터들을 각각 클래스로 만들기 위해 Json으로 변환해줄 거 -> webtoon_model.dart
      // response.bosy는 그냥 String

      final List<dynamic> webtoons = jsonDecode(response.body);
      // 이렇게 데이터를 Json으로 받아온 후에 Class에 활용해보자

      for (var webtoon in webtoons) {
        // print(webtoon);
        final toon = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(toon);
      }

      return webtoonInstances;
    }
    // 요청 성공이 아니면,
    throw Error();
    // Error 던짐
  }
}
