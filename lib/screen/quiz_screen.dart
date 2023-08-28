import 'package:auto_size_text/auto_size_text.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app_test/widget/candidate.dart';

import '../model/quiz.dart';

class QuizScreen extends StatefulWidget {
  List<Quiz> quizs;

  QuizScreen({required this.quizs, super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<int> _answers = [-1, -1, -1, -1];
  List<bool> _answerState = [false, false, false, false];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.deepPurple),
          ),
          width: width * 0.85,
          height: height * 0.5,
          child: Swiper(
            physics: const NeverScrollableScrollPhysics(),
            loop: false,
            itemCount: widget.quizs.length,
            itemBuilder: (context, index) {
              return _buildQuizCard(widget.quizs[index], width, height);
            },
          ),
        ),
      ),
    ));
  }

  Widget _buildQuizCard(Quiz quiz, double width, double height) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, width * 0.024, 0, width * 0.024),
            child: Text(
              'Q${(_currentIndex + 1).toString()}.',
              style: TextStyle(
                fontSize: width * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: width * 0.8,
            padding: EdgeInsets.only(top: width * 0.012),
            child: AutoSizeText(
              quiz.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontSize: width * 0.048,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(child: Container()),
          Column(
            children: _buildCandidates(width, quiz),
          )
        ],
      ),
    );
  }

  List<Widget> _buildCandidates(double width, Quiz quiz) {
    List<Widget> _children = [];
    for (int i = 0; i < 4; i++) {
      _children.add(
        Candidate(
          // 문항 index
          index: i,
          // 문제들
          text: quiz.candidates[i],
          width: width,
          // 답
          answerState: _answerState[i],
          tap: () {
            // 대답했는지 여부 체크
            setState(() {
              for (int j = 0; j < 4; j++) {
                // 문항 index(i)랑 선택index(j)가 같을 경우
                if (j == i) {
                  _answerState[j] = true;
                  // _currentIndex : 문제 번호
                  _answers[_currentIndex] = j;
                } else {
                  _answerState[j] = false;
                }
              }
            });
          },
        ),
      );
      _children.add(
        Padding(
          padding: EdgeInsets.all(width * 0.024),
        ),
      );
    }
    return _children;
  }
}
