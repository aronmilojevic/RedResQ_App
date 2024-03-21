import 'package:flutter/material.dart';
import 'package:redresq_app/application/news.dart';
import 'package:redresq_app/application/quiz_test.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/application/tsunami_module.dart';

class QuizCard extends StatelessWidget {
  final String title;
  final Color myColors;

  const QuizCard({required this.title, required this.myColors, super.key});

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.8;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QuizTest(quizType: title)),
        );
      },
      child: AspectRatio(
        aspectRatio: 1.5,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: myColors,
          elevation: 4.5,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: cardWidth * 0.075,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
