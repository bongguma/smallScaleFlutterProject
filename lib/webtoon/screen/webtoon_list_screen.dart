import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/box_shadow.dart';
import 'package:smallscaleflutterproject/webtoon/services/api_service.dart';
import 'package:smallscaleflutterproject/webtoon/models/webtoon_model.dart';
import 'package:smallscaleflutterproject/webtoon/widget/webtoon_card_widget.dart';

class WebtoonListScreen extends StatelessWidget {
  WebtoonListScreen({Key? key}) : super(key: key);  /// [Key]는 위젯에 'ID' 라고 생각

  /// statefulWidget을 상속 받아 setState() 해주기보다
  /// statelessWidget을 상속 받아 FutureBuilder widget으로 데이터를 받아오는 것이 일반화

  final Future<List<WebtoonModel>> _webtoonList = ApiService.getTodaysToons();

  /// 1. StatefulWidget을 상속받는 경우, setState를 통해 webtoonsList load
  // void _waitForWebtoons() {
  //   ApiService.getTodaysToons().then((webtoonList) {
  //     _webtoonList = webtoonList;
  //
  //     setState(() {   /// [setState()] 는 활용을 지양함.
  //       _isLoading = false;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder(
        future: _webtoonList,
        builder: (context, AsyncSnapshot snapshot) {
          print(snapshot.hasData);
          if (snapshot.hasData) {
            return Column(
              children: [
                SizedBox(height: 50),
                Expanded( /// 남는 영역을 자식 widget으로 채움.
                  child: _webtoonListWidget(snapshot.data!),
                ),
              ],
            );
          };
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _webtoonListWidget(webtoonList) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: webtoonList.length,  /// [hasData]가 [true]일 경우에만 반환하므로 [null] 보증 (!)
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      itemBuilder: (context, index) {
        var webtoon = webtoonList[index];
        return WebtoonCardWidget(webtoon: webtoon);
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: 40);
      },
    );
  }
}
