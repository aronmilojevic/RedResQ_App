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
    double cardWidth = MediaQuery.of(context).size.width * 0.8;

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
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        color: myGreyColor,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: cardWidth * 0.065,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                _trimContent(content),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: cardWidth * 0.04,
                  color: Colors.black,
                ),
              ),
              Text(
                'Read more',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: cardWidth * 0.04,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _trimContent(String content) {
    if (content.length <= 150) {
      return content;
    } else {
      int lastSpaceIndex = content.lastIndexOf(' ', 149);
      return content.substring(0, lastSpaceIndex);
    }
  }
}
