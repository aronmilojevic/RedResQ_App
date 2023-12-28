import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class TsunamiWhatNotToDo extends StatelessWidget {
  const TsunamiWhatNotToDo({Key? key}) : super(key: key);

  TextSpan _buildHeading(String text) {
    return TextSpan(
      text: '\n' + text + '\n',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        color: Colors.black,
      ),
    );
  }

  TextSpan _buildSubHeading(String text) {
    return TextSpan(
      text: '\n' + text + '\n',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black,
      ),
    );
  }

  TextSpan _buildText(String text) {
    return TextSpan(
      text: '\n' + text + '\n',
      style: TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  bottom: 16,
                  right: 16,
                ),
                child: ListView(children: [
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          color: myBlackColor),
                      children: [
                        _buildHeading("What NOT to do in case of a Tsunami"),
                        _buildText(
                            "- Do not stay in low-lying coastal areas after a strong earthquake has been felt. \n\n"
                            "- Do not wait for an official warning before evacuating; authorities may not have enough time to issue a Tsunami Warning. \n\n"
                            "- If a Tsunami Warning is issued, NEVER go down to the beach to watch the waves come in. \n\n"
                            "- Do not try to surf the tsunami. \n\n"
                            "- If you are on a vessel in deep water and a tsunami warning has been issued, do not return to port. \n\n"
                            "- Vessels are safer from tsunami damage while in the deep ocean (>200 fathoms, 1200 ft, 400 m)."),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
