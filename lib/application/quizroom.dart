import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:redresq_app/application/quizcard.dart';

class QuizRoom extends StatelessWidget {
  const QuizRoom({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(top: 20.0),
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
                        color: Color(0xFF66B2FF), // Light Blue
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Quiz Room',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
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
              SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1.5,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return QuizCard(
                      title: 'Category $index',
                      my_colors: _getCategoryColor(index),
                    );
                  },
                  childCount: 6, // Adjust the number of quiz categories
                ),
              ),
            ],
          ),
          Positioned.fill(
            bottom: 0,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return ui.Gradient.linear(
                  Offset(0, bounds.height / 2),
                  Offset(bounds.width, bounds.height / 2),
                  [
                    Colors.transparent,
                    Colors.white.withOpacity(0.8),
                    Colors.white.withOpacity(0.85),
                    Colors.white.withOpacity(0.9),
                    Colors.white.withOpacity(0.95),
                    Colors.white.withOpacity(0.99),
                    Colors.transparent,
                  ],
                  [0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
                  TileMode.repeated,
                );
              },
              blendMode: BlendMode.dstIn,
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getCategoryColor(int index) {
    // Define a color scheme for the categories
    List<Color> categoryColors = [
      Color(0xFF80D8FF), // Light Blue Accent
      Color(0xFFFF8A80), // Light Red Accent
      Color(0xFFAED581), // Light Green Accent
      Color(0xFFFFD54F), // Light Yellow Accent
      Color(0xFF9575CD), // Light Purple Accent
      Color(0xFFFFB74D), // Light Orange Accent
    ];

    // Use modulo to repeat colors if there are more than the defined colors
    return categoryColors[index % categoryColors.length];
  }
}
