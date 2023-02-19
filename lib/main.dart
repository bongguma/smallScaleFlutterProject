import 'package:flutter/material.dart';
import 'package:smallscaleflutterproject/ui_challenge/screen/card_list_screen.dart';
import 'package:smallscaleflutterproject/pomodoro/screen/pomodoro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      routes: {
        '/cardList': (context) => CardListScreen(),
        '/pomodoro': (context) => PomodoroScreen(),
      },
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cardList');
            },
            child: Text('UI CHALLENGE'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/pomodoro');
            },
            child: Text('POMODORO'),
          ),
        ],
      ),
    );
  }
}
