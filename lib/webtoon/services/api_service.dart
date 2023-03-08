import 'package:get/get.dart';
import 'package:smallscaleflutterproject/webtoon/models/webtoon_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService extends GetxController {

  static const String baseUrl = 'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = 'today';

  final RxList<WebtoonModel> _webtoonList = <WebtoonModel>[].obs;

  List<WebtoonModel> get webtoonList => _webtoonList;

  /// [onInit]은 [GetxController]가 생성될 때, 자동으로 실행되는 함수
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getTodaysToons();
  }

  /// [onReady]는 [GetxController]가 생성되고, [onInit]이 실행된 후에 실행되는 함수
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  /// [onClose]는 [GetxController]가 종료될 때, 자동으로 실행되는 함수
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void getTodaysToons() async {
    print('getTodaysToons');
    final url = Uri.parse('${baseUrl}/${today}');
    final response = await http.get(url);

    List<WebtoonModel> webtoonList = [];

    if (response.statusCode == 200) { /// 서버 통신이 성공 했을 때,
      final List<dynamic> webtoons = jsonDecode(response.body);

      for(dynamic webtoon in webtoons) {
        webtoonList.add(WebtoonModel.fromJson(webtoon));
      }
      _webtoonList.addAll(webtoonList);
    }
    throw Error();  /// [statusCode]가 200이 아닌 경우에는 [error]를 던져줌.
  }
}