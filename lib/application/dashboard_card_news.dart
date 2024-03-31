import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class DashboardCardNews extends StatelessWidget {
  final String title;
  final String content;
  final double card1;
  final double card2;

  const DashboardCardNews({
    required this.title,
    required this.content,
    required this.card1,
    required this.card2,
    Key? key,
  }) : super(key: key);

  List<String> _splitContent(String content) {
    List<String> words = content.split(' ');

    List<String> lines = [];
    for (int i = 0; i < words.length; i += 5) {
      int end = i + 5;
      lines.add(
          words.sublist(i, end > words.length ? words.length : end).join(' '));
    }

    return lines.sublist(0, lines.length > 5 ? 5 : lines.length);
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.8;

    return Flexible(
      flex: 1,
      child: Card(
        elevation: 5,
        color: myGreyColor,
        margin: EdgeInsets.fromLTRB(card1, 5, card2, 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Flexible(
              flex: 1,
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: cardWidth * 0.07,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Column(
                    children: _splitContent(content)
                        .map(
                          (line) => Text(
                            line,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: cardWidth * 0.04,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
