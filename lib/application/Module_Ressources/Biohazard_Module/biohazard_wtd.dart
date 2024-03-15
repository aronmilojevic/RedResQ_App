import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class BiohazardWhatToDo extends StatelessWidget {
  const BiohazardWhatToDo({Key? key}) : super(key: key);

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
                            'What to do in case of a biohazard', context),
                        _buildText(
                          'Be proactive and consider things through. Stay cool and offer a level-headed answer.\n\n'
                          'Responses Biological Exposure',
                          context,
                        ),
                        _buildSubHeading('Before First Aid', context),
                        _buildText(
                          'Remember that time is of the essence; do not wait to cleanse your wound or get follow-up care.\n\n'
                          'Stay calm and act fast to minimise potential harm to yourself or others.',
                          context,
                        ),
                        _buildSubHeading(
                            'First Aid Through the skin injuries', context),
                        _buildText(
                          'Wash the site immediately and thoroughly with soap and water (without scrubbing). Do not use harsh detergents or hard scrubbing on wounds.\n\n'
                          'Do not suck on the wound with your mouth.',
                          context,
                        ),
                        _buildSubHeading(
                            'First Aid for eyes, nose and mouth injuries',
                            context),
                        _buildText(
                          'Flush the affected areas immediately and thoroughly with water.',
                          context,
                        ),
                        _buildSubHeading('After the First Aid', context),
                        _buildText(
                          'Report the incident immediately\n\n'
                          'Research the issue\n\n'
                          'Investigate the best techniques to clean the material you\'re working with. Different spills will necessitate different materials and ways to be successful.\n\n'
                          'Isolate and Contain the Issue\n\n'
                          'Avoid touching anything that you believe is contaminated. Find a solution to contain the polluted area while keeping others and pets safe from the incident. It is critical that you create a huge perimeter with a wide margin of error.\n\n'
                          'Ensure access to safety gear\n\n'
                          'Before you begin cleaning, gather the essential supplies. Depending on the extent of the spill and the type of biohazard material, you may need everything from gloves to a full personal protection outfit for your entire body. Choose suitable protection for your eyes and hair.',
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
