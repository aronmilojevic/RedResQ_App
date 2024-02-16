// Aktivität: IN VERWENDUNG
// Responsive: JA
// Status der Seite: Feinichkeiten zu Überarbeiten
// API implementierung: FERTIG
// Responsive: Annähernd fertig
// Kommentar: Telefonnummer entweder entfernen oder nur Nummern erlauben

import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/components/my_headers.dart';
import 'package:redresq_app/login_register/login_page.dart';
import 'package:redresq_app/login_register/register_formular_2.dart';
import 'package:redresq_app/components/my_snackbars.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FirstFormular extends StatefulWidget {
  const FirstFormular({Key? key}) : super(key: key);

  @override
  _FirstFormularState createState() => _FirstFormularState();
}

class _FirstFormularState extends State<FirstFormular> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();
  var maskFormatter = MaskTextInputFormatter(
    mask: '+## ### #########',
    filter: { "#": RegExp(r'[0-9]') }, // Erlaubt nur Ziffern in den Platzhaltern
    initialText: '+43 ', // Optional: Standardtext/Vorwahl
  );

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
                  onPressed: () => Navigator.pop(context),
                  color: myBlackColor,
                ),
              ),
              Text(
                'Create an Account',
                style: headerTextStyle.copyWith(fontSize: screenHeight * 0.035),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'Fill out the text fields below',
                style: subHeaderTextStyle.copyWith(fontSize: screenHeight * 0.02),
              ),
              SizedBox(height: screenHeight * 0.02),
              Image(
                image: AssetImage('lib/assets/register/progress_formular_1outOf3.png'),
                width: screenWidth * 0.9,
                height: screenHeight * 0.1,
                fit: BoxFit.contain,
              ),
              SizedBox(height: screenHeight * 0.03),
              _buildTextFieldWithIcon(Icons.person, _firstNameController, 'First name', screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.02),
              _buildTextFieldWithIcon(Icons.person, _lastNameController, 'Last name', screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.02),
              _buildDateOfBirthTextField(screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.02),
              _buildEMailField(Icons.email, _emailController, 'E-Mail', screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.02),
              _buildMobileNumberTextField(Icons.phone, _mobileNumberController, 'Mobile number', screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.04),
              _buildNextButton(context, screenWidth, screenHeight),
              TextButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      fontSize: screenHeight * 0.02,
                      color: Color(0xff464444),
                    ),
                    children: [
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          fontSize: screenHeight * 0.02,
                          color: myRedColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEMailField(IconData icon, TextEditingController controller, String hintText, double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Material(
        elevation: screenHeight * 0.01,
        borderRadius: BorderRadius.circular(screenHeight * 0.015),
        color: Color(0xfff3f3f3),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(screenHeight * 0.02),
              child: Icon(
                icon,
                color: Color(0xff464444),
                size: screenHeight * 0.03,
              ),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: screenHeight * 0.02),
                ),
                style: TextStyle(fontSize: screenHeight * 0.02),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldWithIcon(IconData icon, TextEditingController controller, String hintText, double screenWidth, double screenHeight, {bool isEmail = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Material(
        elevation: screenHeight * 0.01,
        borderRadius: BorderRadius.circular(screenHeight * 0.015),
        color: Color(0xfff3f3f3),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(screenHeight * 0.02),
              child: Icon(
                icon,
                color: Color(0xff464444),
                size: screenHeight * 0.03,
              ),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: screenHeight * 0.02),
                ),
                style: TextStyle(fontSize: screenHeight * 0.02),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateOfBirthTextField(double screenWidth, double screenHeight) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        child: _buildTextFieldWithIcon(Icons.cake, _dobController, 'Date of birth', screenWidth, screenHeight, isEmail: false),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: myRedColor,
              onPrimary: Colors.white,
              surface: myRedColor,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: myRedColor,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != DateTime.now()) {
      _dobController.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }

  Widget _buildMobileNumberTextField(IconData icon, TextEditingController controller, String hintText, double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Material(
        elevation: screenHeight * 0.01,
        borderRadius: BorderRadius.circular(screenHeight * 0.015),
        color: Color(0xfff3f3f3),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(screenHeight * 0.02),
              child: Icon(
                icon,
                color: Color(0xff464444),
                size: screenHeight * 0.03,
              ),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.phone,
                inputFormatters: [maskFormatter],
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: screenHeight * 0.02),
                ),
                style: TextStyle(fontSize: screenHeight * 0.02),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildNextButton(BuildContext context, double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.9,
      child: MaterialButton(
        elevation: 10,
        color: myRedColor,
        onPressed: () {
          if (_firstNameController.text.isNotEmpty &&
              _lastNameController.text.isNotEmpty &&
              _emailController.text.isNotEmpty &&
              _dobController.text.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondFormular(
                  firstName: _firstNameController.text,
                  lastName: _lastNameController.text,
                  email: _emailController.text,
                  bday: _dobController.text,
                ),
              ),
            );
          } else {
            showErrorSnackbar(context, 'Please fill out all fields before proceeding.');
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
}