import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smallscaleflutterproject/webtoon/models/webtoon_model.dart';

class WebtoonDetailScreen extends StatelessWidget {

  final WebtoonModel webtoon = Get.arguments as WebtoonModel;

  WebtoonDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          webtoon.title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero( /// 화면을 넘나드는 애니메이션 효과를 주는 widget
                tag: webtoon.id,
                child: Container(
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        offset: const Offset(8, 10),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    webtoon.thumb,
                    headers: const {
                      "User-Agent":
                          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
