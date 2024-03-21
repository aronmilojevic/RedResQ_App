import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class TerroristAttackGeneralInformation extends StatelessWidget {
  const TerroristAttackGeneralInformation({Key? key}) : super(key: key);

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
                        _buildSubHeading('International terrorism:'),
                        _buildText(
                            'Violent, criminal acts committed by individuals and/or groups who are inspired by, or associated with, designated foreign terrorist organisations.'),
                        _buildSubHeading('Domestic terrorism:'),
                        _buildText(
                            'Violent, criminal acts committed by individuals and/or groups driven by influences within the country, like political, religious, social, racial, or environmental factors.'),
                        _buildSubHeading('Lone offenders:'),
                        _buildText(
                            'These individuals often radicalize online and mobilize to violence quickly. Lone offenders, who lack evident group links or supervision, are difficult to identify, investigate, and arrest.'),
                        _buildSubHeading('The Internet as a tool'),
                        _buildText(
                            'International and domestic violent extremists have established a strong online presence through chat systems, as well as online photos, videos, and publications. These enable the groups to radicalise and attract those who are open to extremist preaching.'),
                        _buildSubHeading('Social media'),
                        _buildText(
                            'Social media has also provided foreign and domestic terrorists with unparalleled virtual access to individuals, allowing them to carry out atrocities.'),
                        _buildSubHeading('Revolutionary terrorism'),
                        _buildText(
                            'Practitioners of this sort of terrorism want to completely demolish a political system and replace it with new structures. Modern examples of similar behaviour include campaigns by the Italian Red Brigades and the German Red Army Faction (Baader-Meinhof Gang).'),
                        _buildSubHeading('Deadliest terrorist attacks'),
                        _buildText(
                            'The deadliest terrorist strikes to date were the September 11 attacks (2001), in which suicide terrorists associated with al-Qaeda hijacked four commercial aeroplanes, crashing two of them into the twin towers of the World Trade Center complex in New York City and the third into the Pentagon building near Washington, D.C.; the fourth plane crashed near Pittsburgh, Pennsylvania. The crashes destroyed much of the World Trade Center complex and a large portion of one side of the Pentagon and killed more than 3,000 people.'),
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
