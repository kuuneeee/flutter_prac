class WebtoonModel {
  final String title, thumb, id;

  // Named Constructor -> 이름이 fromJson으로 지정 / 원래 있는 메서드가 아님
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
