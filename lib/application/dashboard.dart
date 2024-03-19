import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/application/dashboard_card.dart';
import 'package:redresq_app/application/dashboard_card_news.dart';
import 'package:redresq_app/application/newscard.dart'; // Import NewsCard widget
import 'package:redresq_app/API_Ressources/article.dart';
import 'package:http/http.dart' as http;
import 'package:redresq_app/login_register/profile/userprofile_drawer.dart';

Future<List<Article>> fetchArticle() async {
  final response =
      await http.get(Uri.parse('https://api.redresq.at/news/fetch'),
          // Send authorization headers to the backend.
          headers: {
        HttpHeaders.authorizationHeader:
            "bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTUxMiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3ZlcnNpb24iOiJVc2VyIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9leHBpcmF0aW9uIjoiNjM4NDQyNzczMjY4MjMxNzY2IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiIzIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6InRvZG9yIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoidG9kb3JsYW5rb3ZzenVAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiMiIsImV4cCI6MTcwODY4MDUyNn0.ub8F27nFcGOJvDbZojC6Xun1JDriLgXtpoVHGZ-c59VTYoqVh1TAu7S7ZCK2XOjX3vY1CzWBv0Or89SdPCUwBA.eyJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3ZlcnNpb24iOiJHdWVzdCIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvZXhwaXJhdGlvbiI6IjYzODQxNjg1OTM1MTU3MzQ4MiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IjEiLCJleHAiOjE3MDYwODkxMzV9.OIeY9jVp5r_hseTCYaLjdlIm9CqiwrThS00hytvdsWDrjkCPHIUyC_SnK6ide9SfEm8ozSJcPRlyk6OkMxMNJg",
      });

  if (response.statusCode == 200) {
    print('JSON Response: ${response.body}');

    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Article.fromJson(json)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load articles');
  }
}

void main() {
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
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: cardWidth * 0.025,
              color: myGreyColor,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                IconButton(
                  icon: Icon(Icons.account_circle_rounded),
                  onPressed: _openUserProfile,
                ),
                Text(
                  'Good Day $_name!',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: cardWidth * 0.1,
                    color: Colors.black,
                  ),
                ),
              ]),
            ),
          ),
          Row(
            children: [
              DashboardCard(title: 'Ranking', content: 'Your current rank: 1'),
              DashboardCard(
                  title: 'Contacts', content: 'Emergency: 112 or 911'),
            ],
          ),
          /*FutureBuilder<List<Article>>(
                  future: articles,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Text('No articles available.');
                    }

                    // Use the fetched articles data
                    final articles = snapshot.data!;
                    if (articles.length >= 2) {
                      return Row(
                        children: [
                          DashboardCardNews(
                            title: 'News 1',
                            content: articles[0].content,
                          ),
                          DashboardCardNews(
                            title: 'News 2',
                            content: articles[0].content,
                          ),
                        ],
                      );
                    } else {
                      return Text('Not enough articles available.');
                    }
                  },
                ),*/

          Flexible(
            flex: 4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DashboardCardNews(title: 'News 19090', content: 'lorem'),
                DashboardCardNews(title: 'News 29090', content: 'lorem'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
