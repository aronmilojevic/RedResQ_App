import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class BiohazardGeneralInformation extends StatelessWidget {
  const BiohazardGeneralInformation({Key? key}) : super(key: key);

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
                        _buildSubHeading('What is a biological hazard?'),
                        _buildText(
                            'It is a biological material that is harmful to the health of living creatures, including but not limited to humans.'),
                        _buildSubHeading(
                            'What is included in biological hazards?'),
                        _buildText(
                            'Biological health hazards include bacteria, viruses, parasites and moulds or fungi.'),
                        _buildSubHeading('When are they harmful?'),
                        _buildText(
                            'When inhaled, eaten or come in contact with skin.'),
                        _buildSubHeading('What illnesses do they cause?'),
                        _buildText(
                            'Some illnesses include food poisoning, tetanus, respiratory infections or parasite infections.'),
                        _buildSubHeading('Types of biological hazards'),
                        _buildText('viruses, such as Coronavirus (COVID-19)\n'
                            'toxins from biological sources\n'
                            'spores\n'
                            'fungi\n'
                            'pathogenic micro-organisms\n'
                            'bio-active substances.'),
                        _buildSubHeading(
                            'What are possible places to encounter biological hazards?'),
                        _buildText(
                            'When it comes to biological dangers, animals and animal products including blood, tissue, milk, and eggs are prominent danger zones.\n'
                            'Organic materials (rubbish, wastewater and sewage, plant materials, organic dust, and food) have a high risk of posing biological dangers.'),
                        _buildSubHeading('Facts about biological hazards'),
                        _buildText('Rarely visible\n'
                            'Not well understood\n'
                            'Can cause health issues\n'
                            'Are found everywhere\n'
                            'Majority are harmless\n'
                            'Most dangerous sectors for biological hazards\n'
                            'healthcare\n'
                            'veterinary services\n'
                            'agriculture\n'
                            'sewage management\n'
                            'laboratories'),
                        _buildSubHeading('Example of a biological hazard'),
                        _buildText(
                            'Viruses, such as rhinoviruses, cause the common cold, resulting in a runny nose, sneezing, and coughing. Despite its innocuous character, the common cold spreads readily, offering a pathogen risk, especially in crowded places. This poses a biological risk since the virus may quickly spread from one person to another via respiratory droplets. To reduce the probability of viral transmission, keep your hands clean and cover your mouth and nose while sneezing or coughing.'),
                        _buildSubHeading('The 3 types of biological hazards'),
                        _buildText('Biological Agents\n'
                            'Some biological agents include bacteria, viruses, parasites, and fungi. These are considered harmless if kept under control.\n'
                            'Biotoxins\n'
                            'These are compounds of biological origin that are hazardous and dangerous to humans. Biotoxins are often generated by plants, bacteria, insects, and some mammals.\n'
                            'Environmental specimen\n'
                            'These are plants, soil, or water that potentially contain the first two types of biological hazards—biological agents and biotoxins.'),
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
