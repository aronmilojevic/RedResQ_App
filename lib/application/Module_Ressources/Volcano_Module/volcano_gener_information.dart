import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class VolcanoGeneralInformation extends StatelessWidget {
  const VolcanoGeneralInformation({Key? key}) : super(key: key);

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
                        _buildSubHeading('What is a volcano?'),
                        _buildText(
                            "A volcano is a hole in the planet's surface through which molten rock, hidden under the exterior erupts, often forming a hill or mountain."),
                        _buildSubHeading('Types of volanos'),
                        _buildText(
                            "Active volcanoes are the ones that have recently erupted and are likely to do so again.\n\n"
                            "Dormant volcanoes have not erupted for a long time but have a chance of erupting in the future.\n\n"
                            "Extinct volcanoes are not expected to erupt in the future\n\n"),
                        _buildSubHeading('What is magma?'),
                        _buildText("Molten Rock."),
                        _buildSubHeading('How does a volcano erupt?'),
                        _buildText(
                            "A volcano contains a chamber where magma gathers. Pressure builds up inside the magma chamber, forcing magma to flow through channels in the rock and emerge on the planet's surface."),
                        _buildSubHeading('What is lava?'),
                        _buildText("Magma that flows onto the surface"),
                        _buildSubHeading('Types of eruptions'),
                        _buildText("Some volcanic eruptions are explosive\n\n "
                            "Some occur with a slow lava flow"),
                        _buildSubHeading('What happens during the eruption?'),
                        _buildText(
                            "Eruptions might occur through a primary opening at the volcano's summit or through vents that emerge around the slopes. The volcano's shape is determined by the rate and intensity of its eruptions, as well as the composition of the magma."),
                        _buildSubHeading('Volcanoes under oceans?'),
                        _buildText(
                            "When volcanoes erupt on the ocean floor, the ejected lava frequently forms underwater mountains and mountain ranges as it cools and solidifies. Volcanoes on the ocean floor become islands when the mountains become large enough to rise above the water's surface."),
                        _buildSubHeading(
                            "How does magma rise up to the earth's surface?"),
                        _buildText(
                            "Magma can rise when tectonic plates slowly move away from each other. The magma fills in the space that has been created.\n\n"
                            "The opposite, magma rising when tectonic plates move towards each other, is also possible.\n\n"
                            "Magma rises over hot spots. Hot spots are hot areas inside of Earth. These areas heat up magma. The magma becomes less dense. When it is less dense it rises."),
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
