import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:get/get.dart';
import 'package:smallscaleflutterproject/ui_challenge/screen/card_list_screen.dart';
import 'package:smallscaleflutterproject/pomodoro/screen/pomodoro_screen.dart';
import 'package:smallscaleflutterproject/webtoon/screen/webtoon_detail_screen.dart';
import 'package:smallscaleflutterproject/webtoon/screen/webtoon_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: const Color(0xFFE7626C),
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        cardColor: Colors.white,
      ),
      getPages: [
        GetPage(name: '/cardList', page: () => CardListScreen()),
        GetPage(name: '/pomodoro', page: () => PomodoroScreen()),
        GetPage(name: '/webtoon', page: () => WebtoonListScreen()),
        GetPage(name: '/webtoonDetail', page: () => WebtoonDetailScreen()),
      ],
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Get.toNamed('/cardList');
            },
            child: Text('UI CHALLENGE'),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed('/pomodoro');
            },
            child: Text('POMODORO'),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed('/webtoon');
            },
            child: Text('WEBTOON'),
          ),
          TextButton(
            onPressed: () async {
              print('naver Login');
              NaverLoginResult _result = await FlutterNaverLogin.logIn();
              // await FlutterNaverLogin.logOut();
              print(_result.status);
              print(_result.errorMessage);
              print(_result.accessToken);
              String _id = _result.account.id;
              String _email = _result.account.email;

              print('$_id, $_email');
            },
            child: Text('Naver Login'),
          ),
        ],
      ),
    );
  }
}
