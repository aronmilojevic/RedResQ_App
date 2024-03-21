import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class AnswerCardCorrect extends StatelessWidget {
  final String title;
  final bool isCorrect; // New property
  final VoidCallback onPressed;

  const AnswerCardCorrect({
    required this.title,
    required this.isCorrect,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.8;

    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Card(
        color: Colors.green,
        elevation: 5,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: cardWidth * 0.07,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
