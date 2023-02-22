import 'package:smallscaleflutterproject/webtoon/models/webtoon_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {

  static const String baseUrl = 'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = 'today';

  static Future<List<WebtoonModel>> getTodaysToons() async {
    final url = Uri.parse('${baseUrl}/${today}');
    final response = await http.get(url);

    List<WebtoonModel> webtoonList = [];

    if (response.statusCode == 200) { /// 서버 통신이 성공 했을 때,
      final List<dynamic> webtoons = jsonDecode(response.body);

      for(dynamic webtoon in webtoons) {
        webtoonList.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonList;
    }
    throw Error();  /// [statusCode]가 200이 아닌 경우에는 [error]를 던져줌.
  }
}