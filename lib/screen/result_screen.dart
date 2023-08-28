import 'package:flutter/material.dart';

import '../model/quiz.dart';

class ResultScreen extends StatelessWidget {
  final List<int> answers;
  final List<Quiz> quizs;

  const ResultScreen({
    super.key,
    required this.answers,
    required this.quizs,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    int score = 0;

    for (int i = 0; i < quizs.length; i++) {
      if (quizs[i].answer == answers[i]) {
        score += 1;
      }
    }
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('My Quiz APP'),
        backgroundColor: Colors.deepPurple,
        leading: Container(),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.deepPurple),
            color: Colors.deepPurple,
          ),
          width: width * 0.85,
          height: height * 0.5,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: width * 0.048),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.deepPurple),
                  color: Colors.white,
                ),
                width: width * 0.73,
                height: height * 0.25,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          0, width * 0.048, 0, width * 0.012),
                      child: Text(
                        '수고하셨습니다!',
                        style: TextStyle(
                          fontSize: width * 0.055,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '당신의 점수는',
                      style: TextStyle(
                        fontSize: width * 0.048,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
