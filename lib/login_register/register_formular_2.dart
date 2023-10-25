import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/login_register/register_formular_3.dart';


class SecondFormular extends StatelessWidget {
  const SecondFormular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            const SizedBox(height: 35),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Color(0xff464444),
              ),
            ),
            const Text(
              'Few more steps',
              style: TextStyle(
                color: Color(0xff464444),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              // '*' bei jedem Textfeld welches benötigt wird
              // -- Befülle die Textfelder!
              'Fill out the text fields below',
              style: TextStyle(
                color: Color(0xff464444),
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 5),

            // -- Bild einfügen 2 von 3 und so weiter
            const Image(
              image: AssetImage('lib/assets/register/progress_formular_2outOf3.png'),
              width: 350,
              height: 100,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xfff3f3f3),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.place, // Ändern !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        color: Color(0xff464444),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0x00000000)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0x00000000)),
                          ),
                          hintText: 'Land', // Überetzen !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),


            const SizedBox(height: 10),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xfff3f3f3),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.place, // Ändern !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        color: Color(0xff464444),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0x00000000)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0x00000000)),
                          ),
                          hintText: 'Adresse', // Überetzen !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  Expanded(
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xfff3f3f3),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.place,
                              color: Color(0xff464444),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0x00000000)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0x00000000)),
                                ),
                                hintText: 'Stadt',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16), // Füge etwas Abstand zwischen den beiden Textfeldern hinzu
                  Expanded(
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xfff3f3f3),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.place,
                              color: Color(0xff464444),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0x00000000)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0x00000000)),
                                ),
                                hintText: 'ORT',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),


            const Spacer(),
            Material(
              elevation: 10,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              color: myRedColor,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdFormular()),
                  );
                },
                minWidth: 350,
                height: 60,
                child: const Text(
                  // Vielleicht noch ein Pfeil einbauen ->
                  'Next',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}