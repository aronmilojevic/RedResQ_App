import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:redresq_app/application/dashboard_card.dart';
import 'package:redresq_app/application/dashboard_card_news.dart';

void main() {
  runApp(Dashboard());
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  final _name = 'Theo';

  _launchURL() async {
    Uri url = Uri.parse('https://www.roteskreuz.at/news');
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          AspectRatio(
            aspectRatio: 2.75,
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 5,
              color: myGreyColor,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Good Day $_name!',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27.5,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    DashboardCard(
                        title: 'Ranking', content: 'Your current rank: 1'),
                    DashboardCard(
                        title: 'Emergency Contacts',
                        content: 'Emergency: 112 or 911'),
                  ],
                ),
                Row(children: [
                  DashboardCardNews(
                      title: 'News 1',
                  content:'gii ii i  g g g g g g g g g g g g g  g g g g g g  g g g g g g g g g  g g g g g g  g g g g g g g  g g g  g g g g  g',),

                  DashboardCardNews(
                      title: 'News 2',
                    content:'gii ii i  g g g g g g g g g g g g g  g g g g g g  g g g g g g g g g  g g g g g g  g g g g g g g  g g g  g g g g  g',)

                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
