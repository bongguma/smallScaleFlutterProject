class WebtoonModel {
  final String title;
  final String thumb;
  final String id;

  /// named constructor (이름 있는 생성자)
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
