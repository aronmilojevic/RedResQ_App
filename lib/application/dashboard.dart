import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/application/dashboard_card.dart';
import 'package:redresq_app/application/dashboard_card_news.dart';
import 'package:redresq_app/application/newscard.dart';
import 'package:redresq_app/API_Ressources/article.dart';
import 'package:http/http.dart' as http;
import 'package:redresq_app/login_register/profile/userprofile_drawer.dart';
import 'package:redresq_app/shared/app_information.dart';

Future<List<Article>> fetchArticle() async {
  final response =
      await http.get(Uri.parse('https://api.redresq.at/news/fetch'), headers: {
    HttpHeaders.authorizationHeader:
        "bearer " + AppInformation.getUserToken().toString(),
  });

  if (response.statusCode == 200) {
    print('JSON Response: ${response.body}');

    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Article.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load articles');
  }
}

Future<void> main() async {
  runApp(Dashboard());
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _name = 'Theo';

  late Future<List<Article>> articles;

  @override
  void initState() {
    super.initState();
    articles = fetchArticle();
  }

  void _openUserProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyDrawer()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.8;

    final textStyle = TextStyle(
      shadows: [
        Shadow(
          color: myRedColor,
          blurRadius: 5,
          offset: const Offset(0, 0),
        )
      ],
      color: Colors.white,
      fontSize: MediaQuery.of(context).size.height * 0.05,
      fontWeight: FontWeight.bold,
    );
    double appBarHeight = MediaQuery.of(context).size.height * 0.175;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          AspectRatio(
            aspectRatio: 2.75,
            child: Card(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 5,
              color: myGreyColor,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Good Day User!',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: cardWidth * 0.1,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.account_circle_rounded),
                        onPressed: _openUserProfile,
                        iconSize: MediaQuery.of(context).size.height * 0.036,
                      ),
                    ]),
              ),
            ),
          ),
          Row(
            children: [
              DashboardCard(
                  title: 'Ranking',
                  content: 'Your current rank: 1',
                  card1: 20,
                  card2: 5),
              DashboardCard(
                  title: 'Contacts',
                  content: 'Emergency: 112 or 911',
                  card1: 5,
                  card2: 20),
            ],
          ),
      Row(
        children: [
          DashboardCard(
            title: 'News 1',
            content: 'Lorem Ipsum',
            card1: 20,
            card2: 5,
          ),
          DashboardCard(
              title: 'News 2',
              content: 'Lorem Ipsum',
              card1: 5,
              card2: 20),
        ],
      ),
          /*Flexible(
            flex: 1,
            child: FutureBuilder<List<Article>>(
              future: articles,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('No articles available.');
                }

                final articles = snapshot.data!;
                if (articles.length >= 1) {
                  return Row(
                    children: [
                      DashboardCardNews(
                        title: 'News 1',
                        content: articles[0].content,
                        card1: 20,
                        card2: 5,
                      ),
                      DashboardCardNews(
                          title: 'News 2',
                          content: articles[0].content,
                          card1: 5,
                          card2: 20),
                    ],
                  );
                } else {
                  return Text('Not enough articles available.');
                }
              },
            ),
          ),*/

        ],
      ),
    );
  }
}
