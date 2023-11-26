import 'package:flutter/material.dart';
import 'package:redresq_app/application/newscard.dart';
import 'package:redresq_app/application/news.dart';
import 'package:redresq_app/components/my_colors.dart';

class Newsroom extends StatelessWidget {
  const Newsroom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            collapsedHeight: 125,
            backgroundColor: Colors.transparent,
            scrolledUnderElevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: EdgeInsets.zero,
              title: AspectRatio(
                aspectRatio: 2.75,
                child: Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
          SliverList(
            delegate: SliverChildListDelegate(
              [
                NewsCard(
                  title: 'Floods in Venice',
                  content: 'this is a news',
                ),
                NewsCard(
                  title: 'Wildfires in Naples',
                  content: 'this is a news',
                ),
                NewsCard(
                  title: 'Storms in Vienna',
                  content: 'this is a news',
                ),
                NewsCard(
                  title: 'Tsunamis Tokyo',
                  content: 'this is a news',
                ),
                NewsCard(
                  title: 'China-wide Hurricane!',
                  content: 'this is a news',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
