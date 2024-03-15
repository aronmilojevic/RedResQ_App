import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class News extends StatelessWidget {
  final String title;
  final String content;

  const News({required this.title, required this.content, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      body: Column(children: [
        AspectRatio(
          aspectRatio: 2.75,
          child: Card(
            margin: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: const Color(0xff464444),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: cardWidth * 0.075,
                        fontStyle: FontStyle.normal,
                        color: Color(0xff464444),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  Text(content,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: cardWidth * 0.05,
                        fontStyle: FontStyle.normal,
                        color: myBlackColor,
                      ))
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
