import 'package:flutter/material.dart';
import 'package:redresq_app/application/news.dart';
import 'package:redresq_app/components/my_colors.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String content;

  const NewsCard({required this.title, required this.content, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => News(
              title: title,
              content: content,
            ),
          ),
        );
      },
      child: AspectRatio(
        aspectRatio: 2.75,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 5,
          color: myGreyColor,
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
      ),
    );
  }
}
