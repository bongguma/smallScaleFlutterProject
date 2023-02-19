import 'dart:async';
import 'dart:core';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({Key? key}) : super(key: key);

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  static const defaultMinutes = 1500; /// 정적변수, 컴파일러가 자동 초기화

  int _totalSecond = defaultMinutes;
  bool _isRunning = false;
  late Timer _timer; /// late : 이 변수(프로퍼티)를 당장 초기화하지 않아도 됨. 하지만 사용 이전에 초기화를 해줘야함.

  int _totalPomodoro = 0;

  void _onStartPressed() {
    _isRunning = true;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_totalSecond == 0) {
        _resetTimer();
      } else {
        if (mounted) {
          setState(() {
            _totalSecond = _totalSecond - 1;
          });
        }
      }
    });
  }

  void _onPausePressed() {
    setState(() {
      _isRunning = false;
    });
    _timer.cancel();
  }

  void _stopPressed() {
    _timer.cancel();

    setState(() {
      _isRunning = false;
      _totalSecond = defaultMinutes;
    });
  }

  void _resetTimer() {
    _timer.cancel();

    setState(() {
      _isRunning = false;
      _totalSecond = defaultMinutes;
      _totalPomodoro= _totalPomodoro + 1;
    });
  }

  _formatSecond(int second) {
    var duration = Duration(seconds: second);
    var formatSecond = duration.toString().split('.').first.substring(2, 7);
    return formatSecond;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text('${_formatSecond(_totalSecond)}', style: TextStyle(
                fontSize: 89,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).cardColor,
              ),),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    onPressed: () {
                      _isRunning ? _onPausePressed() : _onStartPressed();
                    },
                    icon: _isRunning ? Icon(Icons.pause_circle_outline) : Icon(Icons.play_circle_outline),
                  ),
                  IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    onPressed: () => _stopPressed(),
                    icon: Icon(Icons.stop_circle_outlined),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoro',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                        Text(
                          '$_totalPomodoro',
                          style: TextStyle(
                            fontSize: 58,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
