import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class BiohazardHowToHelpOthers extends StatelessWidget {
  const BiohazardHowToHelpOthers({Key? key}) : super(key: key);

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
                            'How to help others in case of a biohazard',
                            context),
                        _buildText(
                          "- Ensure that the wound is attended to ASAP.\n\n"
                          "- Do not get yourself or anyone else contaminated.\n\n"
                          "- Secure the contaminated area by limiting access to it from others and be sure to include a buffer zone.\n\n"
                          "- Everyone has to be wearing the appropriate safety gear.\n\n"
                          "- Do not let others suck on your wounds.\n\n"
                          "- Wash the wound of the wounded person.",
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
