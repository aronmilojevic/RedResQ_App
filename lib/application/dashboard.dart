import 'package:flutter/material.dart';
import 'package:redresq_app/application/navbar.dart';

void main() {
  runApp(Dashboard());
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  final _name = 'Theo';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 130,
            margin: const EdgeInsets.only(
              top: 50,
              left: 20,
              right: 20,
            ),
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Text(
              'Good Day $_name!',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 27.5,
                  fontStyle: FontStyle.normal),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    margin: const EdgeInsets.only(
                      top: 20,
                      left: 10,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Text(
                      'Good Day $_name!',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 27.5,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    margin: const EdgeInsets.only(
                      top: 20,
                      left: 10,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Text(
                      'Good Day $_name!',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 27.5,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 225,
                    width: 150,
                    margin: const EdgeInsets.only(
                      top: 20,
                      right: 10,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Text(
                      'Good Day $_name!',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 27.5,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                  Container(
                    height: 75,
                    width: 150,
                    margin: const EdgeInsets.only(
                      top: 20,
                      right: 10,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Text(
                      'Good Day $_name!',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 27.5,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
