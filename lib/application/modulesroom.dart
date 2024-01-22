import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:redresq_app/application/modulescard.dart';
import 'package:redresq_app/components/my_colors.dart';

class ModulesRoom extends StatelessWidget {
  const ModulesRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();

    return Scaffold(
      body: ListView(
        controller: _scrollController,
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
              elevation: 5,
              color: myGreyColor,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Modules',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27.5,
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
            title: 'Floods',
          ),
          ModulesCard(
            title: 'Tsunami',
          ),
          ModulesCard(
            title: 'Volcano',
          ),
          ModulesCard(
            title: 'Biohazard',
          ),
          ModulesCard(
            title: 'Terrorist Attack',
          ),
          ModulesCard(
            title: 'Tornado',
          ),
          ModulesCard(
            title: 'Wildfire',
          ),
        ],
      ),
    );
  }
}
