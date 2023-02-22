import 'package:flutter/material.dart';
import 'package:smallscaleflutterproject/webtoon/services/api_service.dart';

class WebtoonListScreen extends StatelessWidget {
  const WebtoonListScreen({Key? key}) : super(key: key);  /// [Key]는 위젯에 'ID' 라고 생각

  void getTodayToons() {
    ApiService.getTodaysToons();
  }

  @override
  Widget build(BuildContext context) {
    getTodayToons();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          'Webtoons',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ),
        elevation: 0,
      ),
    );
  }
}
