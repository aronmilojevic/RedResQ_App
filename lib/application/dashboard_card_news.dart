import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class DashboardCardNews extends StatelessWidget {
  final String title;
  final String content;

  const DashboardCardNews({
    required this.title,
    required this.content,
    Key? key,
  }) : super(key: key);

  List<String> _splitContent(String content) {
    // Split the content into words
    List<String> words = content.split(' ');

    // Group words into lines with a max of 10 words per line
    List<String> lines = [];
    for (int i = 0; i < words.length; i += 10) {
      int end = i + 10;
      lines.add(
          words.sublist(i, end > words.length ? words.length : end).join(' '));
    }

    // Limit the number of lines to 5
    return lines.sublist(0, lines.length > 5 ? 5 : lines.length);
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.8;
    double cardHeight = MediaQuery.of(context).size.height * 0.3;

    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Padding(
          padding: const EdgeInsets.all(20),
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
                      (line) => FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          line,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: cardWidth * 0.05,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
