import 'package:flutter/material.dart';
import 'package:redresq_app/application/navbar.dart';
import 'package:redresq_app/application/dashboard.dart';

class StartUI extends StatelessWidget {
  const StartUI({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavBar());
  }
}
