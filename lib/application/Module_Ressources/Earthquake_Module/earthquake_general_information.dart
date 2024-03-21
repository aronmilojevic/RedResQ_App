import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class EarthquakeGeneralInformation extends StatelessWidget {
  const EarthquakeGeneralInformation({Key? key}) : super(key: key);

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
                        _buildSubHeading('Background Information'),
                        _buildText(
                            'The surface of the Earth is made up of tectonic plates that lie beneath both the land and oceans of our planet.'),
                        _buildText(
                            'Earthquakes are caused when these plates crash into each other'),
                        _buildSubHeading('Frequency of Earthquakes'),
                        _buildText(
                            'Some places on Earth are experiencing more regular earthquakes due to their positioning being on top of meeting points of tectonic plates'),
                        _buildText(
                            'Small earthquakes (tremors) occur more than thousands of times a day, nevertheless, thanks to their insignificant impact we do not feel them'),
                        _buildText(
                            'Approximately 80% of the world\'s earthquakes occur in the Pacific Ocean\'s rim, known as the "Ring of Fire".'),
                        _buildSubHeading('Tectonic plates'),
                        _buildText(
                            'Immense stress can build up between plates.'),
                        _buildText(
                            'When this stress is suddenly released, huge vibrations, known as seismic waves, travel hundreds of kilometres through to the surface.'),
                        _buildText(
                            'Other earthquakes can occur further from fault zones (where tectonic plates collide) when plates are stretched or compressed.'),
                        _buildSubHeading(
                            'Fault types (Meeting points of tectonic plates)'),
                        _buildText('Strike-Slip'),
                        _buildText(
                            'Strike-slip fault zones occur when parts of the earth\'s crust move “sideways” resulting in a horizontal motion.'),
                        _buildText('Dip-Slip'),
                        _buildText(
                            'Dip-slip fault zones are the product of the ground above the fault zone either descending (normal fault) or pushing up (reverse fault). A normal fault arises when the deeper layer of the crust pulls away from the upper part. The reverse is called a reverse fault'),
                        _buildText('Oblique'),
                        _buildText(
                            'The combination of the previous two fault zones is referred to by scientists as an Obliqe Fault Zone.'),
                        _buildSubHeading('Measuring Earthquakes'),
                        _buildText(
                            'Scientists grade earthquakes based on the intensity and duration of their seismic waves.'),
                        _buildText(
                            'An earthquake measuring 3 to 4.9 is considered minor or light; 5 to 6.9 is moderate to strong; 7 to 7.9 is major; and 8 or more is great.'),
                        _buildSubHeading('Aftershocks'),
                        _buildText(
                            'Earthquakes are always followed by aftershocks, which are smaller earthquakes that might persist for weeks.'),
                        _buildSubHeading(
                            'The most destructive Earthquake measured'),
                        _buildText(
                            'The strongest earthquake ever recorded had a magnitude of 9.5. It was an earthquake that struck southern Chile in 1960. The Valdivia earthquake killed about 1,655 people and left more than two million homeless.'),
                        _buildSubHeading('Earthquake Damage'),
                        _buildText(
                            'Every year, an earthquake of a magnitude of 8 strikes someplace, and around 10,000 people die from earthquakes annually.'),
                        _buildText(
                            'The great majority of people are killed when structures collapse, although the damage is usually worsened by mud slides, fires, floods, or tsunamis. Smaller tremors, which generally occur in the days after a major earthquake, might impede rescue efforts and result in further death and destruction.'),
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
