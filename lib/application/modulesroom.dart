import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:redresq_app/application/modulescard.dart';
import 'package:redresq_app/components/my_colors.dart';

class ModulesRoom extends StatelessWidget {
  const ModulesRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    double cardWidth = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      body: ListView(
        controller: _scrollController,
        children: [
          AspectRatio(
            aspectRatio: 2.75,
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 5,
              color: myGreyColor,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Modules',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: cardWidth * 0.1,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          ModulesCard(
            title: 'Earthquake',
          ),
          ModulesCard(
            title: 'Biohazard',
          ),
          ModulesCard(
            title: 'Tsunami',
          ),
          ModulesCard(
            title: 'Wildfire',
          ),
          ModulesCard(
            title: 'Floods',
          ),
          ModulesCard(
            title: 'Terrorist Attack',
          ),
          ModulesCard(
            title: 'Tornado',
          ),
          ModulesCard(
            title: 'Volcano',
          ),
        ],
      ),
    );
  }
}
