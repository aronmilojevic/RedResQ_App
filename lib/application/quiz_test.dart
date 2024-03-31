import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:redresq_app/application/navbar.dart';
import 'package:redresq_app/application/question_page.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/API_Ressources/Quizzes/quiz.dart';
import 'package:redresq_app/shared/app_information.dart';

class QuizTest extends StatelessWidget {
  final String quizType;
  QuizTest({required this.quizType});

  Future<List<Quiz>> _loadQuizzes() async {
    final response = await http.get(
      Uri.parse('https://api.redresq.at/quiz/fetch'),
      headers: {
        HttpHeaders.authorizationHeader:
            "bearer " + AppInformation.getUserToken().toString(),
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Quiz.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load quizzes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Quiz>>(
        future: _loadQuizzes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No quizzes available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Quiz quiz = snapshot.data![index];
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      color: myGreyColor,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 3,
                      child: ListTile(
                        title: Text(
                          quiz.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Max Score: ${quiz.maxScore}',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuestionPage(
                                title: quiz.questions.toString(),
                                cardColor: Color(0xFFB3D3F8),
                                id: quiz.id,
                                type: quiz.type.name,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: myGreyColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NavBar(isOnline: true, isRestricted: false),
            ),
          );
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
