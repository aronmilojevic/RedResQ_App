import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(Dashboard());
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  final _name = 'Theo';
  _launchURL() async {
    Uri url = Uri.parse('https://www.roteskreuz.at/news');
    if (await launchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 2.75,
            child: Container(
              alignment: Alignment.center,
              height: 100,
              margin: const EdgeInsets.only(
                top: 50,
                left: 20,
                right: 20,
              ),
              decoration: const BoxDecoration(
                color: Color(0xf3f3f3f1),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Text(
                'Good Day $_name!',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27.5,
                    fontStyle: FontStyle.normal),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                          height: 160,
                          width: 150,
                          margin: const EdgeInsets.only(
                            top: 20,
                            left: 10,
                          ),
                          decoration: const BoxDecoration(
                            color: Color(0xf3f3f3f1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: RichText(
                                  text: const TextSpan(children: [
                                    TextSpan(
                                        text:
                                            'Wildfires in \n Lower Austria \n',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            fontStyle: FontStyle.normal)),
                                    TextSpan(
                                        text:
                                            '\n Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et.',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontStyle: FontStyle.normal)),
                                  ]),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              InkWell(
                                onTap: _launchURL,
                                child: const Text(
                                  'continue reading...',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                          height: 160,
                          width: 150,
                          margin: const EdgeInsets.only(
                            top: 20,
                            left: 10,
                          ),
                          decoration: const BoxDecoration(
                            color: Color(0xf3f3f3f1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: RichText(
                              text: const TextSpan(children: [
                                TextSpan(
                                    text: 'Contacts',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        fontStyle: FontStyle.normal)),
                                TextSpan(
                                    text:
                                        '\n \n  Ambulane: 144 \n \n  Fire Department: 122 \n  \n Mountain Rescue: 140 ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontStyle: FontStyle.normal)),
                              ]),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 3,
                        child: Container(
                          height: 225,
                          width: 150,
                          margin: const EdgeInsets.only(
                            top: 20,
                            right: 10,
                          ),
                          decoration: const BoxDecoration(
                            color: Color(0xf3f3f3f1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: RichText(
                              text: const TextSpan(children: [
                                TextSpan(
                                    text: 'Wildfires in \n Lower Austria \n',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        fontStyle: FontStyle.normal)),
                                TextSpan(
                                    text:
                                        '\n Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et.',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontStyle: FontStyle.normal)),
                              ]),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                          height: 75,
                          width: 150,
                          margin: const EdgeInsets.only(
                            top: 20,
                            right: 10,
                          ),
                          decoration: const BoxDecoration(
                            color: Color(0xf3f3f3f1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: RichText(
                              text: const TextSpan(children: [
                                TextSpan(
                                    text: 'Ranking \n',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        fontStyle: FontStyle.normal)),
                                WidgetSpan(
                                    child: SizedBox(
                                  height: 20,
                                )),
                                TextSpan(
                                    text: ' Worlwide: 144 \n',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontStyle: FontStyle.normal)),
                                WidgetSpan(
                                    child: SizedBox(
                                  height: 20,
                                )),
                                TextSpan(
                                    text: '  Countrywide: 1',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontStyle: FontStyle.normal))
                              ]),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
