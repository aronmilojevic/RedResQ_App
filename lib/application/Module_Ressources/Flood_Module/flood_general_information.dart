import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class FloodGeneralInformation extends StatelessWidget {
  const FloodGeneralInformation({Key? key}) : super(key: key);

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
                        _buildSubHeading('How does a flood happen?'),
                        _buildText(
                            'A flood happens when water overflows or soaks land that is usually dry.'),
                        _buildSubHeading(
                            'How long does a flood need to appear?'),
                        _buildText(
                            'Floods can take hours or even days to develop, giving affected people time to prepare. Less often, floods develop quickly and with little warning.'),
                        _buildSubHeading('Riverine floods'),
                        _buildText(
                            'This occurs when rivers overflow their banks. Reasons why rivers may overflow and flood include: Heavy rain, a damaged dam, quick ice melt in the mountains, or a beaver dam. The affected land along the river is termed a floodplain.'),
                        _buildSubHeading('Coastal floods'),
                        _buildText(
                            'When a tsunami or a storm causes the sea to rush inland.'),
                        _buildSubHeading('Effects of floods'),
                        _buildText(
                            'Once the flood is gone there is usually mud leftover. The dirt that is left behind is valuable to farmers since it is nutrient-rich.'),
                        _buildSubHeading('Damage of a flood'),
                        _buildText(
                            'Floods are dangerous and can cause many damages like the flood in Bangladesh that happened in 2007, damaging over a million homes. Floods may create greater harm as the water recedes. The water and environment might be polluted with dangerous elements, such as sharp debris, pesticides, fuel, and untreated sewage.'),
                        _buildSubHeading('Diseases'),
                        _buildText(
                            'Floods can carry deadly diseases like typhoid, malaria, hepatitis A, and cholera. That\'s because flood water is impure and dirty, prime conditions for diseases to flourish.'),
                        _buildSubHeading('Natural causes'),
                        _buildText(
                            'Floods occur naturally. They are part of the water cycle, and the ecology is prepared for flooding. Wetlands near riverbanks, lakes, and estuaries absorb floodwaters. Wetland vegetation, including trees, grasses, and sedges, slows flood waters and distributes their energy more evenly.'),
                        _buildSubHeading('Vulnerable Regions'),
                        _buildText(
                            'The most vulnerable regions are the ones that have not experienced a flood in a long time.'),
                        _buildSubHeading('Artificial causes'),
                        _buildText(
                            'Floods can also have artificial sources. Many man-made floods are intentional and controlled. Rice farmers rely on flooded fields. Engineers may also intentionally flood areas to prevent the possibility of worse flooding. Not all man-made floods are intentional, however.'),
                        _buildSubHeading('Classifications'),
                        _buildText(
                            'Floods are classified by how likely they will happen. The most common classifications include 10, 50 and 100-year floods. 100-year floods are considered rare and occur once in a century, but it also means that 1% of them occur in a given year.'),
                        _buildSubHeading('Flash-Floods'),
                        _buildText(
                            'Sudden, short, and heavy flow of water. Flash floods develop within hours of heavy rainfall. Most deaths from flooding occur as a result of flash floods.'),
                        _buildSubHeading('Predicting floods'),
                        _buildText(
                            'Today, hydrologists study past flood patterns to help predict where and when floods will happen in the future. However, as with all predictions, they are only estimates.'),
                        _buildSubHeading('Preventing floods'),
                        _buildText(
                            'Civilizations have tried to prevent floods for thousands of years. Floods are not always preventable, although they may frequently be minimized. Structures around rivers, lakes, and the sea can contain flood waters. Levees, runoff canals, and reservoirs can stop water from overflowing.'),
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
