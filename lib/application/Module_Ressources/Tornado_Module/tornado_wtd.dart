import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class TornadoWhatToDo extends StatelessWidget {
  const TornadoWhatToDo({Key? key}) : super(key: key);

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
                            'What to do in case of a tornado (DOs)', context),
                        _buildText(
                          "Stay Weather-Ready: Continue to listen to local news to stay updated about tornado watches and warnings.\n\n"
                          "At Your House: Once the tornado is announced, run towards a safe-room, one that doesn’t have any pathways towards the outside.\n\n"
                          "At Your Workplace or School: Follow your tornado drill and get at your storm shelter swiftly and calmly. Stay away from windows and large open areas such as cafeterias, gymnasiums, and auditoriums.\n\n"
                          "Outside: If a tornado is approaching, seek quick cover inside a solid building. Sheds and storage facilities are unsafe. A mobile house or tent aren't either.\n\n"
                          "In a vehicle: Being in a vehicle during a tornado is extremely risky. The best course of action is to drive to the closest shelter. If you can't locate a safe place to hide, either get down in your car and cover your head, or escape and seek safety in a low-lying area such as a ditch or ravine.\n\n"
                          "Before:\n\n"
                          "Understand how tornado warnings are issued, and ensure that your family is informed of the alert.\n\n"
                          "Pay attention to weather warnings.\n\n"
                          "Pick a safe place in your home for household members to gather during a tornado, preferably a basement. Make sure it is away from external doors, windows and walls.\n\n"
                          "If you are in a highrise, pick a place in a hallway in the centre of the building.\n\n"
                          "Have practice drills with your family, so you know what to do and are prepared.\n\n"
                          "Make a preparedness kit. Families should be prepared to be self-sustaining for at least three days.\n\n"
                          "Kits should include practical items such as drinking water, food, cash, and a portable radio.\n\n"
                          "After:\n\n"
                          "Listen to the radio for information and instructions.\n\n"
                          "If you are away from home, only return home when it is safe to do so.\n\n"
                          "Check on vulnerable family members, friends, and neighbours who may need help.\n\n"
                          "Stay away from damaged areas and fallen power lines.\n\n"
                          "If you believe your house is hazardous, do not enter.\n\n"
                          "Wear long pants, a long-sleeved shirt and sturdy shoes when examining your home for damage.\n\n"
                          "Check with local authorities on how to properly dispose of damaged items from your home.",
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
