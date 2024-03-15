import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class TerroristAttackWhatToDo extends StatelessWidget {
  const TerroristAttackWhatToDo({Key? key}) : super(key: key);

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
                            'What to do in case of a terrorist attack (DOs)',
                            context),
                        _buildSubHeading('Before', context),
                        _buildText(
                          'Assemble an emergency kit.\n\n'
                          'Create and review your family emergency plan.\n\n'
                          'Be informed by receiving alerts, warnings, and public safety information before, during, and after emergencies.\n\n'
                          'Be aware of your surroundings. If you see something, say something to public safety officials or the police.\n\n'
                          'Locate emergency exits at public buildings and venues, and know at least two routes to leave a building in the event of an emergency.\n\n'
                          'Be cautious when travelling. Do not leave your own luggage unattended.',
                          context,
                        ),
                        _buildSubHeading('During', context),
                        _buildText(
                          'Follow instructions from public safety officials.\n\n'
                          'Continue to check the media for further information.\n\n'
                          'Call 9-1-1 to report emergencies.\n\n'
                          'If you get a bomb threat, gather as much information as possible from the caller and document what they say.\n\n'
                          'Do not touch any suspicious packages.\n\n'
                          'In an active shooter situation, Run, Hide, and Fight.',
                          context,
                        ),
                        _buildSubHeading('After', context),
                        _buildText(
                          'Continue to check the media for emergency information.\n\n'
                          'Follow instructions from public safety officials.\n\n'
                          'Check with the elderly, relatives, and neighbours who may require extra support to guarantee their safety.',
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
