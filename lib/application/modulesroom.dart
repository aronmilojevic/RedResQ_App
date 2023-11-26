import 'package:flutter/material.dart';
import 'package:redresq_app/application/newscard.dart';
import 'package:redresq_app/application/news.dart';
import 'package:redresq_app/components/my_colors.dart';

class ModulesRoom extends StatelessWidget {
  const ModulesRoom({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(
                top: 20.0), // Add 20 pixels of padding at the top
            sliver: SliverAppBar(
              pinned: true,
              collapsedHeight: 125,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                NewsCard(
                  title: 'Earthquake',
                  content: 'this is a news',
                ),
                NewsCard(
                  title: 'Floods',
                  content: 'this is a news',
                ),
                NewsCard(
                  title: 'Tsunami',
                  content: 'this is a news',
                ),
                NewsCard(
                  title: 'Volcano',
                  content: 'this is a news',
                ),
                NewsCard(
                  title: 'Biohazard',
                  content: 'this is a news',
                ),
                NewsCard(
                  title: 'Terrorist Attack',
                  content: 'this is a news',
                ),
                NewsCard(
                  title: 'Tornado',
                  content: 'this is a news',
                ),
                NewsCard(
                  title: 'Wildfire',
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
