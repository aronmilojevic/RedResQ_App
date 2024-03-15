import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/API_Ressources/Quizzes/quiz.dart';
import 'package:redresq_app/API_Ressources/Quizzes/question.dart';
import 'package:redresq_app/application/question_page.dart';

class QuizTest extends StatelessWidget {
  Future<List<Quiz>> _loadQuizzes() async {
    // You can replace the URL with the actual endpoint to fetch quizzes
    final response = await http
        .get(Uri.parse('https://api.redresq.at/quiz/fetch'), headers: {
      HttpHeaders.authorizationHeader:
          "bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTUxMiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3ZlcnNpb24iOiJVc2VyIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9leHBpcmF0aW9uIjoiNjM4NDYxMDI3MDAwNzkzNTA3IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiIzIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6InRvZG9yIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoidG9kb3JsYW5rb3ZzenVAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiMiIsImV4cCI6MTcxMDUwNTkwMH0.trDsfNCN77PbZnrEWKstxMhnUBGbLmIFlZWpds9K4OMfdOJ4W2-aXYmQAjMveWjyJpnvc1D-ZDhe-Kkr6oqYgQ",
    });

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
            // If the Future is still running, display a loading indicator
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // If the Future encounters an error, display an error message
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // If there is no data or the data is empty, display a message
            return Text('No quizzes available');
          } else {
            // If the data is available, display the quizzes
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Quiz quiz = snapshot.data![index];
                return Card(
                  color: Colors.blue,
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Max Score: ${quiz.type.name}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuestionPage(
                                title: quiz.questions.toString(),
                                cardColor: Color(0xFFB3D3F8),
                                id: quiz.id),
                          ),
                        );
                      }),
                );
              },
            );
          }
        },
      ),
    );
  }
}
