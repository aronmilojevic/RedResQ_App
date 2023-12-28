import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:redresq_app/application/modulescard.dart';
import 'package:redresq_app/application/newscard.dart';
import 'package:redresq_app/application/news.dart';
import 'package:redresq_app/components/my_colors.dart';

class ModulesRoom extends StatelessWidget {
  const ModulesRoom({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(
                  top: 20.0), // Add 20 pixels of padding at the top
              sliver: SliverAppBar(
                pinned: true,
                collapsedHeight: 150,
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
                          'Modules',
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
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  ModulesCard(
                    title: 'Earthquake',
                    my_colors: Color(0xFFCF945D61),
                  ),
                  ModulesCard(
                    title: 'Floods',
                    my_colors: Color(0xFFA9C9DBA6),
                  ),
                  ModulesCard(
                    title: 'Tsunami',
                    my_colors: Color(0xFFB3D3F8AB),
                  ),
                  ModulesCard(
                    title: 'Volcano',
                    my_colors: Colors.blueGrey,
                  ),
                  ModulesCard(
                    title: 'Biohazard',
                    my_colors: Colors.deepOrange,
                  ),
                  ModulesCard(
                    title: 'Terrorist Attack',
                    my_colors: Colors.lightGreenAccent,
                  ),
                  ModulesCard(
                    title: 'Tornado',
                    my_colors: Colors.purpleAccent,
                  ),
                  ModulesCard(
                    title: 'Wildfire',
                    my_colors: Colors.greenAccent,
                  ),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 30,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                transform: GradientRotation(90),
                colors: [
                  Colors.white
                      .withOpacity(0.8), // Adjust opacity for a cloudy effect
                  Colors.white
                      .withOpacity(0.85), // Adjust opacity for a cloudy effect
                  Colors.white
                      .withOpacity(0.90), // Adjust opacity for a cloudy effect
                  Colors.white
                      .withOpacity(0.95), // Adjust opacity for a cloudy effect
                  Colors.white
                      .withOpacity(0.99), // Adjust opacity for a cloudy effect
                  Colors.transparent,
                ],
                stops: [
                  0.0,
                  0.2,
                  0.4,
                  0.6,
                  0.8,
                  1.0
                ], // Adjust stops for a cloudy effect
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
