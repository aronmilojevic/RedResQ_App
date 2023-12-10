import 'package:flutter/material.dart';
import 'package:redresq_app/application/navbar.dart';

class StartUI extends StatelessWidget {
  const StartUI({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: NavBar(
      isOnline: true,
    ));
  }
}

class StartUIOffline extends StatelessWidget {
  const StartUIOffline({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: NavBar(
      isOnline: false,
    ));
  }
}
