import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class WildfireWhatToDo extends StatelessWidget {
  const WildfireWhatToDo({Key? key}) : super(key: key);

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
                            'What to do in case of a Wildfire', context),
                        _buildSubHeading('Before a Wildfire', context),
                        _buildText(
                            "Make a wildfire plan. This plan should contain an evacuation strategy, a communication plan, and a plan for dealing with your pets and animals.\n\n"
                            "Make sure your home is defensible. This means clearing away flammable vegetation from around your home, creating defensible space, and making sure your home is up to code.\n\n"
                            "Assemble an emergency kit. This kit should include food, water, first aid supplies, and other essential items.\n\n"
                            "Stay informed on wildfire conditions. You may accomplish this by listening to the radio, following the news, or signing up for wildfire warnings.",
                            context),
                        _buildSubHeading('During a Wildfire', context),
                        _buildText(
                            "If you are told to evacuate, do so immediately.\n\n"
                            "If you are unable to flee, find a safe spot indoors. Close all windows and doors, and turn off fans and air conditioners.\n\n"
                            "If you are caught in a wildfire, try to stay in a low area and avoid dense vegetation.\n\n"
                            "If you see smoke or flames, report them immediately to the authorities.",
                            context),
                        _buildSubHeading('After a Wildfire', context),
                        _buildText(
                            "Be careful when returning to your home. There may be hidden dangers, such as downed power lines or falling debris.\n\n"
                            "Wear a mask to protect yourself from smoke and ash.\n\n"
                            "Do not drink contaminated water.\n\n"
                            "Avoid entering burned areas.\n\n"
                            "Help your neighbors and community recover from the wildfire.",
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
