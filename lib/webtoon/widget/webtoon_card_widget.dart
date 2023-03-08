import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smallscaleflutterproject/webtoon/models/webtoon_model.dart';
import 'package:smallscaleflutterproject/webtoon/screen/webtoon_detail_screen.dart';

class WebtoonCardWidget extends StatelessWidget {
  final WebtoonModel webtoon;

  WebtoonCardWidget({
    Key? key,
    required this.webtoon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/webtoonDetail', arguments: webtoon);
      },
      child: Column(
        children: [
          Hero(
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
          const SizedBox(
            height: 10,
          ),
          Text(
            webtoon.title,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
