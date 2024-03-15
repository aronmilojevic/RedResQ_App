import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redresq_app/API_Ressources/Moduless/page.dart';
import 'package:redresq_app/API_Ressources/Moduless/content.dart';
import 'package:redresq_app/API_Ressources/Moduless/book.dart';

class DynamicDisasterPage extends StatefulWidget {
  final String disasterType;
  final int pageIndex; // Add this parameter

  DynamicDisasterPage({
    Key? key,
    required this.disasterType,
    required this.pageIndex,
  }) : super(key: key);

  @override
  _DynamicDisasterPageState createState() => _DynamicDisasterPageState();
}

class _DynamicDisasterPageState extends State<DynamicDisasterPage> {
  late Future<Book> _bookData;

  @override
  void initState() {
    super.initState();
    _bookData = _loadBook(widget.disasterType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Book>(
        future: _bookData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error loading book: ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            return _buildPageView(snapshot.data!, widget.pageIndex);
          } else {
            return Center(
              child: Text("Unknown error occurred."),
            );
          }
        },
      ),
    );
  }

  Widget _buildPageView(Book book, int pageIndex) {
    Pages currentPage = book.page[pageIndex];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
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
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          currentPage.title,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          currentPage.content.content,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Future<Book> _loadBook(String disasterType) async {
    try {
      String jsonString = await rootBundle
          .loadString('lib/assets/learning_modules/$disasterType.json');
      if (jsonString.isNotEmpty) {
        Map<String, dynamic> jsonData = json.decode(jsonString);
        return Book.fromJson(jsonData);
      } else {
        throw "Error: JSON data is empty.";
      }
    } catch (error) {
      throw "Error loading book: $error";
    }
  }
}
