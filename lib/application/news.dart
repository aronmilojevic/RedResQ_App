import 'package:flutter/material.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        AspectRatio(
          aspectRatio: 2.75,
          child: Container(
            alignment: Alignment.center,
            height: 100,
            margin: const EdgeInsets.only(
              top: 50,
              left: 20,
              right: 20,
            ),
            decoration: const BoxDecoration(
              color: Color(0xf3f3f3f1),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Text(
              'Wildfires Lower Austria',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 27.5,
                  fontStyle: FontStyle.normal),
            ),
          ),
        ),
        AspectRatio(
          aspectRatio: 0.95,
          child: Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
            ),
            decoration: const BoxDecoration(
              color: Color(0xf3f3f3f1),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                        text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis at consectetur lorem donec massa sapien faucibus. Enim diam vulputate ut pharetra. Nec feugiat in fermentum posuere urna nec tincidunt. Ornare massa eget egestas purus viverra accumsan in. Varius vel pharetra vel turpis nunc eget lorem dolor. Blandit aliquam etiam erat velit scelerisque in. Libero justo laoreet sit amet cursus sit amet dictum. Consectetur purus ut faucibus pulvinar elementum integer enim neque volutpat. Feugiat pretium nibh ipsum consequat nisl vel. Venenatis lectus magna fringilla urna porttitor rhoncus. Odio eu feugiat pretium nibh. Sed id semper risus in hendrerit gravida. Mi in nulla posuere sollicitudin aliquam ultrices. In eu mi bibendum neque egestas congue quisque egestas. Risus commodo viverra maecenas accumsan lacus vel.' +
                            ' Lorem mollis aliquam ut porttitor leo a diam. Tellus cras adipiscing enim eu turpis egestas pretium aenean. Mollis aliquam ut porttitor leo a. Nec feugiat nisl pretium fusce id. Bibendum neque egestas congue quisque egestas diam. At quis risus sed vulputate. Egestas pretium aenean pharetra magna ac placerat vestibulum lectus. In metus vulputate eu scelerisque felis imperdiet proin fermentum. Et magnis dis parturient montes nascetur ridiculus mus. Nulla posuere sollicitudin aliquam ultrices sagittis orci a scelerisque. Nisi scelerisque eu ultrices vitae auctor.' +
                            'Malesuada bibendum arcu vitae elementum curabitur. Tellus integer feugiat scelerisque varius morbi enim. In cursus turpis massa tincidunt dui ut ornare lectus sit. Quisque egestas diam in arcu cursus euismod. Mi ipsum faucibus vitae aliquet nec ullamcorper sit amet risus. Risus feugiat in ante metus dictum at tempor commodo ullamcorper. Morbi tristique senectus et netus et. Neque viverra justo nec ultrices dui. At risus viverra adipiscing at in tellus integer feugiat. Aliquam ut porttitor leo a diam sollicitudin. Bibendum at varius vel pharetra vel turpis nunc eget. Ac felis donec et odio pellentesque diam. Enim sit amet venenatis urna cursus. Facilisi etiam dignissim diam quis enim lobortis scelerisque fermentum dui. Nec tincidunt praesent semper feugiat nibh sed.' +
                            'Pellentesque habitant morbi tristique senectus et netus et malesuada fames. Leo vel fringilla est ullamcorper eget nulla facilisi etiam dignissim. Nisl nunc mi ipsum faucibus. Non arcu risus quis varius quam quisque id. Nibh nisl condimentum id venenatis a condimentum. Porttitor eget dolor morbi non arcu. Tellus rutrum tellus pellentesque eu. Volutpat maecenas volutpat blandit aliquam. Rhoncus aenean vel elit scelerisque. Luctus accumsan tortor posuere ac ut. Suspendisse potenti nullam ac tortor vitae purus. Leo a diam sollicitudin tempor id eu nisl. Gravida arcu ac tortor dignissim convallis. Cursus eget nunc scelerisque viverra mauris in. Dolor sit amet consectetur adipiscing elit duis tristique. Elit eget gravida cum sociis natoque penatibus et magnis. Donec pretium vulputate sapien nec sagittis aliquam malesuada bibendum. Nisi vitae suscipit tellus mauris. Risus at ultrices mi tempus imperdiet nulla malesuada pellentesque. Hendrerit gravida rutrum quisque non tellus orci ac auctor.' +
                            'Nisi quis eleifend quam adipiscing vitae proin sagittis nisl. A lacus vestibulum sed arcu non odio euismod lacinia at. Dolor morbi non arcu risus. Aliquam purus sit amet luctus venenatis lectus magna. At quis risus sed vulputate odio ut enim blandit volutpat. Iaculis nunc sed augue lacus viverra vitae congue eu. Condimentum lacinia quis vel eros donec. Elementum pulvinar etiam non quam lacus suspendisse faucibus. Malesuada pellentesque elit eget gravida cum sociis natoque penatibus et. Tristique sollicitudin nibh sit amet commodo. Ut sem viverra aliquet eget sit amet tellus. Semper quis lectus nulla at volutpat diam ut venenatis tellus.',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontStyle: FontStyle.normal)),
                  ]),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
