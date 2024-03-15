import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class WildfireHowToHelpOthers extends StatelessWidget {
  const WildfireHowToHelpOthers({Key? key}) : super(key: key);

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
                        _buildHeading('How to Help Others', context),
                        _buildHeading(
                            'How to help others in case of a Wildfire',
                            context),
                        _buildText(
                          "Before a Wildfire:\n\n"
                          "- Get prepared yourself, by ensuring that you have a plan for yourself and your family in case of a wildfire.\n\n"
                          "- Volunteer your time. Many organizations need help preparing for and responding to wildfires.\n\n"
                          "During a Wildfire:\n\n"
                          "- Help evacuate those who need assistance. This may include people who are elderly, disabled, or who have small children.\n\n"
                          "- Volunteer your time. There are several ways to assist during a wildfire, including distributing food and water, caring for animals, and providing childcare.\n\n"
                          "After a Wildfire:\n\n"
                          "- Continue to check on your neighbors. They may require assistance with tasks such as cleaning their houses, doing repairs, and submitting insurance claims.",
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
