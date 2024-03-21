import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class VolcanoWhatToDo extends StatelessWidget {
  const VolcanoWhatToDo({Key? key}) : super(key: key);

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
                            'What to do in case of a Volcano', context),
                        _buildSubHeading(
                            'If the lava is headed towards you', context),
                        _buildText(
                            "Leave the area immediately. If you are warned to evacuate due to an eruption, evacuate.\n\n"
                            "Driving is advised if possible. When driving keep doors and windows closed. Drive away from the danger.",
                            context),
                        _buildSubHeading('If you are indoors', context),
                        _buildText(
                            "Close all openings to the house or apartment.\n\n"
                            "Turn off all heating and air conditioning systems.\n\n"
                            "Ensure that pets and animals are in closed shelters.",
                            context),
                        _buildSubHeading('If you are outdoors', context),
                        _buildText(
                            "Seek shelter indoors.\n\n"
                            "Roll into a ball to protect your head if you find yourself under a rockfall.\n\n"
                            "If near a stream or river, be aware of rising water and possible mudflows in low-lying areas. Move up-slope as quickly as possible.\n\n"
                            "If you have burns, treat them immediately.",
                            context),
                        _buildSubHeading('Protecting during ashfall', context),
                        _buildText(
                            "Stay inside with closed openings.\n\n"
                            "Wear long-sleeved clothing.\n\n"
                            "Wear protective glasses.\n\n"
                            "If the ashfall does not stop falling, be sure to leave the house as the heavy ashes can collapse the roof.\n\n"
                            "Listen to authorities.",
                            context),
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
