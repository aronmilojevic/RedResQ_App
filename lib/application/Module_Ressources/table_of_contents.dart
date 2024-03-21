import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class TableOfContents extends StatelessWidget {
  final String disasterType;

  const TableOfContents({Key? key, required this.disasterType})
      : super(key: key);

  TextSpan _buildHeading(String text) {
    return TextSpan(
      text: '\n' + text + '\n',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Colors.black,
      ),
    );
  }

  TextSpan _buildSubHeading(String text) {
    return TextSpan(
      text: '\n' + text + '\n',
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 15,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 20,
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
              child: ListView(children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      color: myBlackColor,
                    ),
                    children: [
                      _buildHeading(disasterType),
                      TextSpan(
                          text: '\n Table of contents \n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.black,
                          )),
                      _buildSubHeading(
                          'General Information: ${disasterType}...2'),
                      _buildSubHeading(
                          'What to do in case of ${disasterType}...3'),
                      _buildSubHeading(
                          'What NOT to do in case of ${disasterType}...4'),
                      _buildSubHeading(
                          'How to help others in case of ${disasterType}...5'),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
