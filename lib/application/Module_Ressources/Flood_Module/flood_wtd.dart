import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class FloodWhatToDo extends StatelessWidget {
  const FloodWhatToDo({Key? key}) : super(key: key);

  double _getResponsiveFontSize(BuildContext context, double baseSize) {
    // Adjust this factor based on your design requirements
    double scaleFactor = MediaQuery.of(context).size.width / 375.0;
    return baseSize * scaleFactor;
  }

  TextSpan _buildHeading(String text, BuildContext context) {
    return TextSpan(
      text: '\n' + text + '\n',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: _getResponsiveFontSize(context, 25),
        color: Colors.black,
      ),
    );
  }

  TextSpan _buildSubHeading(String text, BuildContext context) {
    return TextSpan(
      text: '\n' + text + '\n',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: _getResponsiveFontSize(context, 20),
        color: Colors.black,
      ),
    );
  }

  TextSpan _buildText(String text, BuildContext context) {
    return TextSpan(
      text: '\n' + text + '\n',
      style: TextStyle(
        fontSize: _getResponsiveFontSize(context, 14),
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
                        fontSize: _getResponsiveFontSize(context, 14),
                        fontStyle: FontStyle.normal,
                        color: myBlackColor,
                      ),
                      children: [
                        _buildHeading(
                            'What to do in case of a flood (DOs)', context),
                        _buildSubHeading('Before a flood', context),
                        _buildText(
                          'Find safe shelter and hide there.\n\n'
                          'Do not walk, swim, or drive across floodwaters. Turn around and don\'t drown!\n\n'
                          'Stay off bridges.\n\n'
                          'Depending on the type of flooding:\n\n'
                          'Evacuate if told to do so.\n\n'
                          'Move to higher ground or a higher floor.\n\n'
                          'Stay where you are.',
                          context,
                        ),
                        _buildSubHeading('During a flood', context),
                        _buildText(
                          'Do not walk, swim, or drive through the water. Do not drown!\n\n'
                          'If you are advised to evacuate, do so!\n\n'
                          'Stay inside your car if it is trapped in rapidly moving water. Get on the roof if water is rising inside the car.\n\n'
                          'If you\'re imprisoned within a building, get to the topmost floor. Do not ascend into a closed attic to prevent being trapped by rising floodwater.',
                          context,
                        ),
                        _buildSubHeading('After a flood', context),
                        _buildText(
                          'Pay attention to authorities for information and instructions. Return home only when authorities say it is safe.\n\n'
                          'Avoid driving except in emergencies.\n\n'
                          'Be mindful of the dangers of electrocution. Do not touch wet electrical equipment or stand in water. Turn off the electricity if it is safe to do so.',
                          context,
                        ),
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
