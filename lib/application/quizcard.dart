import 'package:flutter/material.dart';
import 'package:redresq_app/application/news.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/application/tsunami_module.dart';

class QuizCard extends StatelessWidget {
  final String title;
  final Color myColors;

  const QuizCard({required this.title, required this.myColors, super.key});


  @override
  Widget build(BuildContext context) {
    return
    AspectRatio(
        aspectRatio: 1.5,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 5,
          color: myColors,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
                fontStyle: FontStyle.normal,
                color: Color(0xff464444),
              ),
            ),
          ),
        ),
    );
  }
}
