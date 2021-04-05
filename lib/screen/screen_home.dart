import 'package:flutter/material.dart';
import 'package:quiz_app_test/model/model_quiz.dart';
import 'package:quiz_app_test/screen/screen_quiz.dart';

class HomeScreen extends StatefulWidget {
  //statefulwidget : 위젯의 생명주기동안 값이 변할 수 있는 위젯
  @override
  _HomeScreenState createState() => _HomeScreenState();
  //변수명 앞에 언더바를 붙이면 private 변수
}

class _HomeScreenState extends State<HomeScreen> {
  //리스트를 3개 만든다. 퀴즈를 보여주기 위한 3개
  List<Quiz> quizs = [
    Quiz.fromMap({
      'title': 'test',
      'candidates': ['a', 'b', 'c', 'd'],
      'answer': 0
    }),
    Quiz.fromMap({
      'title': 'test',
      'candidates': ['a', 'b', 'c', 'd'],
      'answer': 0
    }),
    Quiz.fromMap({
      'title': 'test',
      'candidates': ['a', 'b', 'c', 'd'],
      'answer': 0
    }),
  ];
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    //화면크기를 알아내기 위해 MediaQuery클래스를 활용한다.
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
      //기기별로 다른 statusBar 영역에 자동으로 padding을 넣어주는 역할을 한다.
      child: Scaffold(
        //틀같은건데
        appBar: AppBar(
          // 앱바(제일위에있는거)
          title: Text('My Quiz App'),
          backgroundColor: Colors.deepPurple,
          leading: Container(),
        ),
        body: Column(
          // 가운데 영역(행열 중 열이 기준)
          mainAxisAlignment:
              MainAxisAlignment.center, // 가로정렬(행의 경우 주축은 가로, 열의 경우 주축은 세로 기준)
          crossAxisAlignment: CrossAxisAlignment.center, //세로정렬
          children: <Widget>[
            Center(
              // 중앙
              child: Image.asset(
                'image/quiz.jpeg',
                width: width * 0.8,
              ),
            ),
            Padding(
              // 안쪽
              padding: EdgeInsets.all(width * 0.024),
            ),
            Text(
              // 이미지 아래 텍스트
              '이나의 아무거나 퀴즈 앱',
              style: TextStyle(
                fontSize: width * 0.065,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              // 위 텍스트 아래 설명
              '퀴즈를 풀기 전 안내사항입니다. \n꼼꼼히 읽고 퀴즈 풀기를 눌러주세요.',
              textAlign: TextAlign.center,
            ),
            Padding(
              // 안쪽에 쓴다
              padding: EdgeInsets.all(width * 0.048),
            ),
            _buildStep(width, '1. 랜덤으로 나오는 퀴즈 3개를 풀어보세요.'),
            _buildStep(width, '2. 문제를 잘 읽고 정답을 고른 뒤\n 다음 문제 버튼을 눌러주세요.'),
            _buildStep(width, '3. 만점을 맞으면 치킨 한마리 쏩니다!'),
            Padding(
              padding: EdgeInsets.all(width * 0.048),
            ),
            Container(
              padding: EdgeInsets.only(bottom: width * 0.036),
              child: Center(
                child: ButtonTheme(
                  minWidth: width * 0.8,
                  height: height * 0.05,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: RaisedButton(
                    child: Text(
                      '지금 퀴즈 풀기',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.deepPurple,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            quizs: quizs,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStep(double width, String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          width * 0.048, width * 0.024, width * 0.048, width * 0.024),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.check_box,
            size: width * 0.04,
          ),
          Padding(
            padding: EdgeInsets.only(right: width * 0.024),
          ),
          Text(title),
        ],
      ),
    );
  }
}
