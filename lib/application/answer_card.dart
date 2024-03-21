import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class AnswerCard extends StatefulWidget {
  final String title;
  final bool isCorrect;
  final VoidCallback onPressed;
  final Function(bool) onAnswer;

  AnswerCard({
    required this.title,
    required this.isCorrect,
    required this.onPressed,
    required this.onAnswer,
    Key? key,
  }) : super(key: key);

  @override
  _AnswerCardState createState() => _AnswerCardState();
}

class _AnswerCardState extends State<AnswerCard> {
  var _cardColor = myGreyColor;

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.8;

    return Flexible(
      flex: 1,
      child: Card(
        color: _cardColor,
        elevation: 5,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GestureDetector(
          onTap: () {
            if (widget.isCorrect) {
              _updateCardColor(Colors.green);
            } else {
              _updateCardColor(Colors.red);
              _updateBackgroundImage();
            }
            widget.onPressed();
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                widget.title,
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
      ),
    );
  }

  void _updateCardColor(Color color) {
    setState(() {
      _cardColor = color;
      if (!widget.isCorrect) {
        widget.onAnswer(false);
      } else {
        widget.onAnswer(true);
      }
    });
  }

  void _updateBackgroundImage() {}
}
