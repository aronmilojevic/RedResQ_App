import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/components/my_headers.dart';
import 'package:redresq_app/login_register/register_formular_3.dart';
import 'package:intl/intl.dart';
import 'package:redresq_app/components/my_snackbars.dart';
import 'package:http/http.dart' as http;


class SecondFormular extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String bday;
  final int sex;

  const SecondFormular({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.bday,
    required this.sex,
  }) : super(key: key);

  @override
  _SecondFormularState createState() => _SecondFormularState();
}

class _SecondFormularState extends State<SecondFormular> {
  TextEditingController _adresseController = TextEditingController();
  TextEditingController _stadtController = TextEditingController();
  TextEditingController _ortController = TextEditingController();

  String? _selectedCountry;
  List<Map<String, dynamic>> _countries = [];

  @override
  void initState() {
    super.initState();
    _fetchCountries();
  }

  Future<void> _fetchCountries() async {
    try {
      final String? guestToken = await fetchAuthToken();

      final response = await http.get(
        Uri.parse('https://api.redresq.at/country/fetch'),
        headers: {
          HttpHeaders.authorizationHeader: "bearer $guestToken",
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );

      print(response.body);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _countries = data.map<Map<String, dynamic>>((dynamic item) {
            return {'id': item['id'], 'countryName': item['countryName']};
          }).toList();
        });
      } else {
        throw Exception('Failed to fetch countries');
      }
    } catch (error) {
      print('Error fetching countries: $error');
    }
  }

  Future<String?> fetchAuthToken() async {
    final apiUrl = 'https://api.redresq.at/guest/request';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
      );

      if (response.statusCode == 200) {
        final String authToken = response.body;
        return authToken;
      } else {
        print('Fehler beim Abrufen des Authentifizierungstokens: ${response.statusCode}');
        print('API-Antwort: ${response.body}');
        return null;
      }
    } catch (error) {
      print('Netzwerkfehler beim Abrufen des Authentifizierungstokens: $error');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                SizedBox(height: screenHeight * 0.04),

                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: myBlackColor,
                  ),
                ),

                Text(
                  'Few more steps',
                  style: headerTextStyle.copyWith(fontSize: screenHeight * 0.035),
                ),

                SizedBox(height: screenHeight * 0.01),

                Text(
                  'Fill out the text fields below',
                  style: subHeaderTextStyle.copyWith(fontSize: screenHeight * 0.02),
                ),

                SizedBox(height: screenHeight * 0.02),

                Image(
                  image: AssetImage('lib/assets/register/progress_formular_2outOf3.png'),
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.1,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: screenHeight * 0.03),
                _buildDropdownMenu(),
                SizedBox(height: screenHeight * 0.02),
                _buildTextFieldWithIcon(Icons.place, _adresseController, 'Address'),
                SizedBox(height: screenHeight * 0.02),
                _buildCityAndOrtFields(),
                SizedBox(height: screenHeight * 0.04),
                _buildNextButton(context),
              ],
            ),
          ),
        )
    );
  }

  Widget _buildDropdownMenu() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Material(
        elevation: screenHeight * 0.008,
        borderRadius: BorderRadius.circular(screenHeight * 0.015),
        color: const Color(0xfff3f3f3),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(screenHeight * 0.015),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(screenHeight * 0.02),
                child: Icon(
                  Icons.location_on,
                  color: Color(0xff464444),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.015),
                    child: DropdownButtonFormField<String>(
                      value: _selectedCountry,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedCountry = value!;
                          print(value);
                        });
                      },
                      items: _buildDropdownItems(),
                      icon: Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.arrow_drop_down),
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Select Country',
                        hintStyle: TextStyle(fontSize: screenHeight * 0.02),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  List<DropdownMenuItem<String>> _buildDropdownItems() {
    List<DropdownMenuItem<String>> items = [];

    for (var country in _countries) {
      String countryName = country['countryName'];
      String countryId = country['id'].toString();
      items.add(
        DropdownMenuItem<String>(
          value: countryId,
          child: Text(countryName),
        ),
      );
    }
    return items;
  }



  Widget _buildTextFieldWithIcon(IconData icon, TextEditingController controller, String hintText) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Material(
        elevation: screenHeight * 0.01,
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xfff3f3f3),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(screenHeight * 0.02),
              child: Icon(
                icon,
                color: Color(0xff464444),
              ),
            ),
            Expanded(
              child: TextField(
                style: TextStyle(fontSize: screenHeight * 0.02),
                controller: controller,
                onChanged: (value) {
                  controller.text = value;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x00000000)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x00000000)),
                  ),
                  hintText: hintText,
                  hintStyle: TextStyle(fontSize: screenHeight * 0.02),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCityAndOrtFields() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Row(
        children: [
          Expanded(
            child: Material(
              elevation: screenHeight * 0.01,
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xfff3f3f3),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(screenHeight * 0.02),
                    child: Icon(
                      Icons.place,
                      color: Color(0xff464444),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _stadtController,
                      onChanged: (value) {
                        _stadtController.text = value;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0x00000000)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0x00000000)),
                        ),
                        hintText: 'City',
                        hintStyle: TextStyle(fontSize: screenHeight * 0.02),

                      ),
                      style: TextStyle(fontSize: screenHeight * 0.02 ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.05),
          Expanded(
            child: Material(
              elevation: screenHeight * 0.01,
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xfff3f3f3),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(screenHeight * 0.02),
                    child: Icon(
                      Icons.place,
                      color: Color(0xff464444),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _ortController,
                      onChanged: (value) {
                        _ortController.text = value;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0x00000000)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0x00000000)),
                        ),
                        hintText: 'Place',
                        hintStyle: TextStyle(fontSize: screenHeight * 0.02),

                      ),
                      style: TextStyle(fontSize: screenHeight * 0.02 ),

                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildNextButton(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.9,
      child: MaterialButton(
        elevation: 10,
        color: myRedColor,
        onPressed: () {
          if (_areAllFieldsFilled()) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ThirdFormular(
                  firstName: widget.firstName,
                  lastName: widget.lastName,
                  email: widget.email,
                  bday: DateFormat('dd/MM/yyyy').parse(widget.bday),
                  sex: widget.sex,
                  country: int.parse(_selectedCountry!),
                ),
              ),
            );
          } else {
            showErrorSnackbar(context, 'Please fill out all fields');
          }
        },

        child: Text(
          'Next',
          style: TextStyle(color: Colors.white, fontSize: screenHeight * 0.0255, fontWeight: FontWeight.bold),
        ),
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(screenHeight * 0.015)),
      ),
    );
  }

  bool _areAllFieldsFilled() {
    return _adresseController.text.isNotEmpty &&
        _stadtController.text.isNotEmpty &&
        _ortController.text.isNotEmpty &&
        _selectedCountry != null;
  }
}
