import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class TsunamiHowToHelpOthers extends StatelessWidget {
  const TsunamiHowToHelpOthers({Key? key}) : super(key: key);

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
                        _buildHeading('How to Help Others'),
                        _buildSubHeading('Before a Tsunami'),
                        _buildText(
                            "- Talk about tsunamis. Explain that a tsunami is a natural event and not anyone’s fault. \n\n"
                            "- Use simple words that even young children can understand.\n\n "
                            "- Identify hazard areas. Find out if your home, school, child care provider, workplace, or other frequently visited locations are in tsunami hazard areas.\n\n "
                            "- Learn about evacuation plans. If your child’s school or child care center is in a tsunami zone, find out how its emergency plan addresses tsunamis. \n\n"
                            "- Find out what its evacuation plans are and if you would be required to pick up your children from the site or from another location.\n\n "
                            "- Stay informed: Regularly listen to a local news station on a NOAA Weather Radio, a portable, battery-powered radio or television. \n\n"
                            "- Listen for and respond to tsunami watches and warnings. Evacuate if told to do so or if you feel unsafe.\n\n"
                            "- Practice evacuation drills. Practice family evacuation plans so that, in a tsunami situation, children can evacuate quickly and safely.\n\n "
                            "- If possible, pick evacuation areas 100 feet (30 meters) above sea level or go as far as two miles (three kilometers) inland, away from the coastline."),
                        _buildSubHeading('During a Tsunami'),
                        _buildText(
                            "- Know that earthquakes can cause tsunamis. "
                            "If you feel an earthquake that lasts 20 seconds or longer when you are in a coastal area, you should Drop, Cover, and Hold on. "
                            "First protect yourself from the earthquake. When the shaking stops, gather family members and move quickly to higher ground, away from the coast.\n\n"
                            "- DO NOT wait for an official warning to evacuate. "
                            "- After a coastal area earthquake, a tsunami may be coming within minutes.\n\n"
                            "- When shaking stops, evacuate, even if an official order has not yet been given or an alert siren has not sounded.\n\n"
                            "- Expect aftershocks. If the earthquake was large enough it may trigger more aftershocks that may create more tsunamis."),
                        _buildSubHeading('After a Tsunami'),
                        _buildText(
                            "- Involve people in recovery. After a tsunami, include people in clean-up activities if it is safe to do so.\n\n "
                            "- It is comforting to people but especially children to watch the household begin to return to normal and to have a job to do.\n\n"
                            "- Listen to people. Encourage people to express feelings of fear, anger and worry. \n\n"
                            "- Listen carefully, show understanding and offer reassurance. Tell people that the situation is not permanent,"
                            "and provide physical reassurance through time spent together and displays of affection."),
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
