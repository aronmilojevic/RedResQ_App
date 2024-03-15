import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class WildfireWhatNotToDo extends StatelessWidget {
  const WildfireWhatNotToDo({Key? key}) : super(key: key);

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
                            "What NOT to do during a Wildfire", context),
                        _buildText(
                          "Don't ignore evacuation orders. If you are told to evacuate, do so immediately.\n\n"
                          "Don't try to fight the fire yourself. Leave firefighting to the professionals.\n\n"
                          "Do not drive into a wildfire. Smoke may obscure your vision and imprison you.\n\n"
                          "Do not return to your house until it is safe to do so. Wait until the authorities give the all-clear.\n\n"
                          "Don't open windows or doors. This can let smoke and ash into your home.\n\n"
                          "Don't drink contaminated water. Boil water or use bottled water.\n\n"
                          "Don't eat food that has been exposed to smoke or ash. Throw it away.\n\n"
                          "Do not enter burning areas. There might be hidden risks, such as fallen power wires or falling debris.\n\n"
                          "Don't try to clean up ash yourself. Leave it to the professionals.",
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
