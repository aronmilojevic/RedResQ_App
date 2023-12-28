import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class TsunamiWhatToDo extends StatelessWidget {
  const TsunamiWhatToDo({Key? key}) : super(key: key);

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
                        _buildHeading('What to do in case of a tsunami'),
                        _buildSubHeading('During a Tsunami'),
                        _buildText(
                            "- If there is an earthquake and you are in a tsunami area, protect yourself from the earthquake first. Drop, Cover, and Hold On.\n\n "
                            "- Drop to your hands and knees. Cover your head and neck with your arms. Hold on to any sturdy furniture until the shaking stops. \n\n"
                            "- Crawl only if you can reach a better cover, but do not go through an area with more debris.\n\n"
                            "- Get to high ground as far inland as possible.\n\n "
                            "- Listen to emergency information and alerts. Always follow the instructions from local emergency managers. \n\n"
                            "- Evacuate: DO NOT wait! Leave as soon as you see any natural signs of a tsunami or receive an official tsunami warning.\n\n"
                            "- If you are in the water, then grab onto something that floats, such as a raft or tree trunk. \n\n"
                            "- If you are in a boat, face the direction of the waves and head out to sea. \n\n"
                            "- If you are in a harbor, go inland."),
                        _buildSubHeading('After a Tsunami'),
                        _buildText(
                            "- Be aware of the risk of electrocution. Underground or downed power lines can electrically charge water.\n\n "
                            "- Do not touch electrical equipment if it is wet or if you are standing in water. \n\n"
                            "- Stay away from damaged buildings, roads, and bridges. \n\n"
                            "- Avoid wading in floodwater, which can contain dangerous debris. Water may be deeper than it appears.")
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
