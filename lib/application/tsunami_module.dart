import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

class TsunamiModule extends StatelessWidget {
  const TsunamiModule({Key? key}) : super(key: key);

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
      body: Column(children: [
        AspectRatio(
          aspectRatio: 2.75,
          child: Card(
            margin: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: const Color(0xff464444),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Expanded(
                    child: Text(
                      'Tsunami',
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        fontStyle: FontStyle.normal,
                        color: Color(0xff464444),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
              padding: const EdgeInsets.all(16),
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
                      _buildSubHeading('What is a tsunami?'),
                      _buildText(
                          "A large wave that is caused by movements in Earth's outer layer, or crust, which move ocean water"),
                      _buildSubHeading('Characteristics of a Tsunami'),
                      _buildText(
                          "- A tsunami travels outward from the source region as a series of waves.\n\n"
                          "- Its speed and height depend upon the depth of the water.\n\n"
                          "- In the deep ocean, tsunamis travel between 500 and 1000 km/h.\n\n"
                          "- Tsunamis have periods that range between a couple of minutes to as much as an hour.\n\n"
                          "- Damage and destruction are caused by three factors: inundation, wave impact on structures, and erosion.\n\n"
                          "- Secondary damage is common"),
                      _buildSubHeading('Historical Tsunami'),
                      _buildText(
                          "A tsunami documented to occur through eyewitnesses or instrumental observation within the historical record."),
                      _buildSubHeading('Local Tsunami'),
                      _buildText(
                          "A local tsunami is a tsunami that originates from within 200 km of the coast or within 1 hour tsunami travel time. "
                          "It is usually caused by an earthquake but can also be caused by a landslide or a volcanic eruption. "
                          "Local tsunamis cause 90% of tsunami casualties."),
                      _buildSubHeading('Microtsunami'),
                      _buildText(
                          "A tsunami of such small amplitude that it is not easily detected visually."),
                      _buildSubHeading('Ocean-wide Tsunami'),
                      _buildText(
                          "A tsunami that is capable of widespread destruction, not only in the immediate region of its generation but across an entire ocean. "
                          "All ocean-wide tsunamis have been generated by major earthquakes. Synonym for teletsunami or distant Tsunami"),
                      _buildSubHeading('Regional Tsunami'),
                      _buildText(
                          "A tsunami capable of destruction in a particular geographic region, generally within 1,000 km or 1-3 hours tsunami travel time from its source."),
                      _buildSubHeading('Teletsunami'),
                      _buildText(
                          "A tsunami originating from a far-away source, generally more than 1,000 km or more than 3 hours tsunami travel time from its source. "
                          "More devastating than the Regional Tsunami, however, it is less frequent"),
                      _buildSubHeading('Tsunami Meaning'),
                      _buildText(
                          "Japanese term meaning wave (“nami”) in a harbor (“tsu”). A series of traveling waves of extremely long length and period, usually generated by disturbances associated with earthquakes occurring below or near the ocean floor."),
                      _buildSubHeading('The Misleading Term Tidal Waves'),
                      _buildText(
                          "The popular term tidal waves is entirely misleading as tsunamis have nothing in common with tides."),
                      _buildHeading('What to do in case of a tsunami'),
                      _buildSubHeading('During a Tsunami'),
                      _buildText(
                          "- If there is an earthquake and you are in a tsunami area, protect yourself from the earthquake first. Drop, Cover, and Hold On.\n\n "
                          "- Drop to your hands and knees. Cover your head and neck with your arms. Hold on to any sturdy furniture until the shaking stops. \n\n"
                          "- Crawl only if you can reach a better cover, but do not go through an area with more debris.\n\n"
                          "- Get to high ground as far inland as possible.\n\n "
                          "- Listen to emergency information and alerts. Always follow the instructions from local emergency managers. \n\n"
                          "- Evacuate: DO NOT wait! Leave as soon as you see any natural signs of a tsunami or receive an official tsunami warning.\n\n"
                          "- If you are in the water, then grab onto something that floats, such as a raft or tree trunk. \n\n"
                          "- If you are in a boat, face the direction of the waves and head out to sea. \n\n"
                          "- If you are in a harbor, go inland."),
                      _buildSubHeading('After a Tsunami'),
                      _buildText(
                          "- Be aware of the risk of electrocution. Underground or downed power lines can electrically charge water.\n\n "
                          "- Do not touch electrical equipment if it is wet or if you are standing in water. \n\n"
                          "- Stay away from damaged buildings, roads, and bridges. \n\n"
                          "- Avoid wading in floodwater, which can contain dangerous debris. Water may be deeper than it appears."),
                      _buildHeading("What NOT to do in case of a Tsunami"),
                      _buildText(
                          "- Do not stay in low-lying coastal areas after a strong earthquake has been felt. \n\n"
                          "- Do not wait for an official warning before evacuating; authorities may not have enough time to issue a Tsunami Warning. \n\n"
                          "- If a Tsunami Warning is issued, NEVER go down to the beach to watch the waves come in. \n\n"
                          "- Do not try to surf the tsunami. \n\n"
                          "- If you are on a vessel in deep water and a tsunami warning has been issued, do not return to port. \n\n"
                          "- Vessels are safer from tsunami damage while in the deep ocean (>200 fathoms, 1200 ft, 400 m)."),
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
                      _buildText("- Know that earthquakes can cause tsunamis. "
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
      ]),
    );
  }
}
