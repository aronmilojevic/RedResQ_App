import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class TerroristAttackWhatNotToDo extends StatelessWidget {
  const TerroristAttackWhatNotToDo({Key? key}) : super(key: key);

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
                            "What not to do in case of a terrorist attack (DONTs)",
                            context),
                        _buildText(
                          "Don’t be negligent of the terrorist attack, stay vigilant.\n\n"
                          "Don’t be scared to report suspicious people.\n\n"
                          "Don’t walk, RUN.\n\n"
                          "If there is an explosion, do not run in its direction.\n\n"
                          "If there is a fire, don’t use doors, look for fire exits.\n\n"
                          "Don’t make calls during an attack, text only.\n\n"
                          "Don’t leave your phone on loud mode.\n\n"
                          "If you are taken hostage, do not panic, stay calm!\n\n"
                          "Do not disobey instructions.\n\n"
                          "After the attack, do not bottle up, try and talk about your experience.\n\n"
                          "Do not think you can treat your own severe wounds, visit a doctor.\n\n"
                          "Do not engage in contact willingly with the attackers.",
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
