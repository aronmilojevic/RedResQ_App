import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class EarthquakeWhatToDo extends StatelessWidget {
  const EarthquakeWhatToDo({Key? key}) : super(key: key);

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
                            'What to do in case of an Earthquake', context),
                        _buildSubHeading('Before', context),
                        _buildText(
                          'Try to prepare your home → Examine each section of your house to discover objects that may fall or shatter in the case of an earthquake. Consider reorganising the area by shifting heavy items to lower shelves.\n\n'
                          'Fixing and latching furniture onto the wall can be more tedious, however, it can pay out in the end.\n\n'
                          'Prepare an emergency kit → Food and water for 72 hours!!',
                          context,
                        ),
                        _buildSubHeading('During', context),
                        _buildText(
                          'Drop\n\n'
                          'Get down on your hands and knees to protect yourself from being knocked over. That also puts you in an ideal position to crawl for shelter.\n\n'
                          'Cover\n\n'
                          'Place an arm and hand over your head and neck to shield them from debris. Head for any nearby tables to shelter under until the shaking stops. If a table isn’t in sight, sidle up to one of your home’s interior walls away from tall objects and furniture that might topple.\n\n'
                          'Hold\n\n'
                          'Stay put until the shaking stops. If you’re under a shelter like a table, keep hold of it with one hand. If you’re out in the open, continue to shield your head and neck with your arms.\n\n'
                          'If you are in a wheelchair, lock the wheels and then lean over to protect your vital organs, covering your head and neck with your arms.',
                          context,
                        ),
                        _buildSubHeading('After', context),
                        _buildText(
                          'Be aware of the aftershocks, aka the smaller earthquakes.\n\n'
                          'Check for injuries.\n\n'
                          'If you\'re entrapped, keep cool. Protect your mouth, nose, and eyes from the dust, then phone or text for assistance. To gain the attention of the responders, make noise by whistling or screaming.\n\n'
                          'Keep an eye out for hazards like fallen electrical lines, ruptured gas pipes, or precarious structures.',
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
