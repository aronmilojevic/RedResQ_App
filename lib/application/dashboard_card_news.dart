import 'package:flutter/material.dart';

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

    // Group words into lines with a max of 15 words per line
    List<String> lines = [];
    for (int i = 0; i < words.length; i += 10) {
      int end = i + 10;
      lines.add(words.sublist(i, end > words.length ? words.length : end).join(' '));
    }

    // Limit the number of lines to 5
    return lines.sublist(0, lines.length > 5 ? 5 : lines.length);
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.9;

    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(30),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200], // Adjust the color as needed
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
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
                        fontSize: cardWidth * 0.07, // Adjust the factor as needed
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(color: Colors.grey),
                  SizedBox(height: 10),
                  Column(
                    children: _splitContent(content)
                        .map(
                          (line) => FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          line,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: cardWidth * 0.08, // Adjust the factor as needed
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
        ),
      ),
    );
  }
}
