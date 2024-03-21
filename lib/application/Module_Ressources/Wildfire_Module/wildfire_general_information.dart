import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class WildfireGeneralInformation extends StatelessWidget {
  const WildfireGeneralInformation({Key? key}) : super(key: key);

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
                        _buildHeading('General Information'),
                        _buildSubHeading('What is wildfire?'),
                        _buildText(
                            'A wildfire is an uncontrolled fire that starts in wildland vegetation, typically in rural settings.'),
                        _buildSubHeading('Where do wildfires burn?'),
                        _buildText(
                            'Wildfires may occur in forests, grasslands, savannas, and other ecosystems and have done so for hundreds of millions of years.'),
                        _buildSubHeading('Ground fires'),
                        _buildText(
                            'Ground fires are a form of wildfire that usually starts in soil rich in organic debris that may fuel the flames, such as plant roots. These fires can burn slowly, producing smoke but no flames for an extended period.'),
                        _buildSubHeading('Surface fires'),
                        _buildText(
                            'Surface fires burn in dead or dry vegetation that is lying or growing just above the ground. These types of fires are fueled by dead leaves.'),
                        _buildSubHeading('Crown fires'),
                        _buildText(
                            'Crown fires burn in the leaves of trees and bushes.'),
                        _buildSubHeading('Wildfire combination'),
                        _buildText(
                            'These three types of wildfires combine to form wildfires together, more often surface- and crown fires.'),
                        _buildSubHeading('How do wildfires start?'),
                        _buildText(
                            'Natural Occurrences such as Lightning strikes or human-made sparks.'),
                        _buildSubHeading('How do wildfires grow?'),
                        _buildText(
                            'Weather conditions are the main benefactor to whether an area is in danger of wildfires. For example, rain, winds, and extreme weather conditions can leave an area very dry and thus in high danger of a wildfire.'),
                        _buildSubHeading('The productive side of wildfires'),
                        _buildSubHeading(
                            'Wildfires are necessary for the survival of several plant species.'),
                        _buildText(
                            'For example, certain tree cones must be heated before they open and release their seeds.'),
                        _buildSubHeading(
                            'Wildfires also assist in maintaining ecological health.'),
                        _buildText(
                            'They may eradicate insects and illnesses that threaten trees. Fires can remove scrub and underbrush, allowing for new grasses, herbs, and shrubs to give food and habitat for animals and birds.'),
                        _buildSubHeading('Climate change and wildfires'),
                        _buildText(
                            'Climate change has left some ecosystems more endangered by flames. Warmer temperatures have intensified drought and dried out forests.'),
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
