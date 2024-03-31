import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final String content;
  final double card1;
  final double card2;

  const DashboardCard({
    required this.title,
    required this.content,
    required this.card1,
    required this.card2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.9;

    return Expanded(
      child: Card(
        elevation: 5,
        color: myGreyColor,
        margin: EdgeInsets.fromLTRB(card1, 0, card2, 10),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
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
                SizedBox(height: 10),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    content,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: cardWidth * 0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
