import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class TornadoGeneralInformation extends StatelessWidget {
  const TornadoGeneralInformation({Key? key}) : super(key: key);

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
                        _buildSubHeading('What are tornadoes?'),
                        _buildText(
                            'Tornadoes are vertical cones of rapidly spinning air.'),
                        _buildSubHeading('What is a tornado specifically?'),
                        _buildText(
                            'Tornadoes are fiercely spinning air columns that go from thunderstorms to the ground. Notable highlights are: a dark and greenish sky and black storm clouds.'),
                        _buildSubHeading('What causes tornadoes?'),
                        _buildText('Thunderstorms cause tornadoes.'),
                        _buildSubHeading('What causes a tornado specifically?'),
                        _buildText(
                            'Supercells, or massive thunderstorms with whirling winds, produce the most powerful tornadoes. Approximately one in every thousand storms develops into a supercell, and one out of every five or six supercells produces a tornado.'),
                        _buildSubHeading('Supercells'),
                        _buildText(
                            'Giant thunderstorms producing the most violent of tornadoes.'),
                        _buildSubHeading('Where do they occur?'),
                        _buildText(
                            'Tornadoes are widespread, however, they most often occur in the U.S. where more than 1000 of them appear annually.'),
                        _buildSubHeading('How do they appear?'),
                        _buildText(
                            'A funnel suddenly appears that hits the ground and roars forward with a horrible sound.'),
                        _buildSubHeading('Tornadoes forming?'),
                        _buildText(
                            'Tornadoes arise when warm, humid air collides with cold, dry air. Thunderstorms form when denser cold air overpowers warm air due to contact. Rotation may begin when warm air ascends through cooler air, generating an updraft, if the wind speed or direction varies sufficiently. This spinning updraft, known as a mesocycle, accelerates its rotation by drawing warm air from the oncoming thunderstorm. Furthermore, frigid air from the jet stream, a vigorous high-altitude wind circulation, provides energy to the developing tornado.'),
                        _buildSubHeading('Companions of tornadoes'),
                        _buildText('Hail and thunderstorms.'),
                        _buildSubHeading('Lifespan of a tornado'),
                        _buildText(
                            'It may live for as little as a few seconds or as long as three hours.'),
                        _buildSubHeading('Issues with measuring tornadoes?'),
                        _buildText(
                            'Anemometers, which measure wind speed, cannot withstand the enormous force of tornadoes to record them.'),
                        _buildSubHeading('Fujita scale'),
                        _buildText(
                            'Using units F0 to F5, the Fujita scale measures a tornado\'s intensity by analyzing the damage the twister has done and then matching that to the wind speeds estimated to produce comparable damage.'),
                        _buildSubHeading('Tornado forecasted'),
                        _buildText(
                            'Doppler radar, satellites, weather balloons, and computer modelling are technologies used here.'),
                        _buildSubHeading(
                            'Know the difference between a tornado warning and a tornado watch:'),
                        _buildText(
                            'A tornado warning means a tornado is already occurring or will occur soon in your area. Evacuate if advised to do so.\n\n'
                            'A tornado watch means a tornado is possible in your area. Stay alert for more information.'),
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
