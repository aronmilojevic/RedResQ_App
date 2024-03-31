import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:redresq_app/application/newscard.dart';
import 'package:redresq_app/application/news.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/API_Ressources/article.dart';
import 'package:http/http.dart' as http;
import 'package:redresq_app/shared/app_information.dart';

Future<List<Article>> fetchArticle() async {
  final response = await http
      .get(Uri.parse('https://api.redresq.at/news/fetch?limit=10'), headers: {
    HttpHeaders.authorizationHeader:
        "bearer " + AppInformation.getUserToken().toString(),
  });

  if (response.statusCode == 200) {
    print('JSON Response: ${response.body}');

    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Article.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load articles' + response.statusCode.toString());
  }
}

class Newsroom extends StatefulWidget {
  const Newsroom({super.key});

  @override
  _NewsroomState createState() => _NewsroomState();
}

class _NewsroomState extends State<Newsroom> {
  late Future<List<Article>> articles;

  @override
  void initState() {
    super.initState();
    articles = fetchArticle();
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      body: ListView(
        children: [
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
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  'Newsroom',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: cardWidth * 0.1,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          FutureBuilder<List<Article>>(
            future: articles,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Text('No articles available.'),
                );
              }
              final articles = snapshot.data!;
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return NewsCard(
                    title: article.title,
                    content: article.content,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
