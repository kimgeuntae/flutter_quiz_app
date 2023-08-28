import 'package:flutter/material.dart';

class Candidate extends StatefulWidget {
  final VoidCallback tap;
  final String text;
  final int index;
  final double width;
  bool answerState;

  Candidate({
    super.key,
    required this.tap,
    required this.text,
    required this.index,
    required this.width,
    required this.answerState,
  });

  @override
  State<Candidate> createState() => _CandidateState();
}

class _CandidateState extends State<Candidate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.8,
      height: widget.width * 0.1,
      padding: EdgeInsets.fromLTRB(
        widget.width * 0.048,
        widget.width * 0.024,
        widget.width * 0.048,
        widget.width * 0.024,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.deepPurple),
        color: widget.answerState ? Colors.deepPurple : Colors.white,
      ),
      child: InkWell(
        // 컨테이너와 같이 별도의 제스쳐 기능을 제공하지 않는 위젯에 제스쳐 기능을 추가하고자 할 때 InkWell
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: widget.width * 0.035,
            color: widget.answerState ? Colors.white : Colors.black,
          ),
        ),
        onTap: () {
          setState(() {
            widget.tap();
            widget.answerState = !widget.answerState;
          });
        },
      ),
    );
  }
}
