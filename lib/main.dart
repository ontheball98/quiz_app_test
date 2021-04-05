import 'package:flutter/material.dart'; //
import 'package:quiz_app_test/screen/screen_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //MeterialApp 실행
      title: 'My Quiz App', // 타이틀 설정
      home: HomeScreen(), // 앱의 루트 경로 HomeScreen 실행
    );
  }
}
