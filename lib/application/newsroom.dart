import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:redresq_app/application/newscard.dart';
import 'package:redresq_app/application/news.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/API_Ressources/article.dart';
import 'package:http/http.dart' as http;

Future<List<Article>> fetchArticle() async {
  final response =
      await http.get(Uri.parse('https://api.redresq.at/news/fetch'),
          // Send authorization headers to the backend.
          headers: {
        HttpHeaders.authorizationHeader:
            "bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTUxMiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IiIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJ0bGFua292IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoidG9kb3JsYW5rb3ZzenVAZ21haWxjb20iLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiIyIiwiZXhwIjoxNzA0MjIxMTY5fQ.-T0g9qXfR_nTMmdID23P9Ko_0JgY-nKwp8x0pfnhjfgUPJ2iuzEUvCawQyFYHBNAP5KkRHEq62G2q0HNd9V-EA",
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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(
                top: 20.0), // Add 20 pixels of padding at the top
            sliver: SliverAppBar(
              pinned: true,
              collapsedHeight: 125,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              scrolledUnderElevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: EdgeInsets.zero,
                title: AspectRatio(
                  aspectRatio: 2.75,
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                    color: myGreyColor,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Newsroom',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                          fontStyle: FontStyle.normal,
                          color: Color(0xff464444),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              titleSpacing: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          FutureBuilder<List<Article>>(
            future: articles,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasError) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text('Error: ${snapshot.error}'),
                  ),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text('No articles available.'),
                  ),
                );
              }

              // Use the fetched articles data
              final articles = snapshot.data!;
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final article = articles[index];
                    return NewsCard(
                      title: article.title,
                      content: article.content,
                    );
                  },
                  childCount: articles.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
