import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/login_register/register_formular_2.dart';

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
              'Create an Account',
              style: TextStyle(
                color: Color(0xff464444),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Fill out the text fields below',
              style: TextStyle(
                color: Color(0xff464444),
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 5),
            const Image(
              image: AssetImage('lib/assets/register/progress_formular_1outOf3.png'),
              width: 350,
              height: 100,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            _buildTextFieldWithIcon(Icons.person, _firstNameController, 'First name'),
            const SizedBox(height: 10),
            _buildTextFieldWithIcon(Icons.person, _lastNameController, 'Last name'),
            const SizedBox(height: 10),
            _buildDateOfBirthTextField(),
            const SizedBox(height: 30),
            _buildTextFieldWithIcon(Icons.email, _emailController, 'E-Mail', isEmail: true),
            const SizedBox(height: 10),
            _buildTextFieldWithIcon(Icons.phone, _mobileNumberController, 'Mobile number'),
            const Spacer(),
            _buildNextButton(context),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldWithIcon(IconData icon, TextEditingController controller, String hintText, {bool isEmail = false, bool isDate = false}) {
    return Padding(
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
                icon,
                color: Color(0xff464444),
              ),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                onEditingComplete: () {
                  if (isEmail) {
                    _validateEmail(controller.text, controller);
                  }
                },
                onChanged: (value) {
                  if (isDate) {
                    _dobController.text = _formatDateOfBirth(value);
                  } else {
                    _formatText(value, controller);
                  }
                },
                keyboardType: isDate ? TextInputType.number : TextInputType.text,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x00000000)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x00000000)),
                  ),
                  hintText: hintText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateOfBirthTextField() {
    return Padding(
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
                Icons.cake,
                color: Color(0xff464444),
              ),
            ),
            Expanded(
              child: TextField(
                controller: _dobController,
                onChanged: (value) {
                  _dobController.text = _formatDateOfBirth(value);
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x00000000)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x00000000)),
                  ),
                  hintText: 'Date of birth (DD/MM/YYYY)',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _validateEmail(String value, TextEditingController controller) {
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid Email. Please enter a valid email address.'),
        ),
      );
      controller.text = '';
    }
  }

  void _formatText(String value, TextEditingController controller) {
    if (controller == _firstNameController || controller == _lastNameController) {
      String formattedValue = value.replaceAll(RegExp(r'[^a-zA-Z]'), '');
      if (formattedValue != value) {
        controller.text = formattedValue;
      }
    } else {
      if (value.contains(RegExp(r'[0-9]'))) {
        String formattedValue = value.replaceAll(RegExp(r'[0-9]'), '');
        if (formattedValue != value) {
          controller.text = formattedValue;
        }
      } else {
        controller.text = value;
      }
    }
  }

  String _formatDateOfBirth(String input) {
    String formattedValue = input.replaceAll(RegExp(r'[^0-9]'), '');

    if (formattedValue.length > 2) {
      formattedValue = formattedValue.substring(0, 2) + '/' + formattedValue.substring(2);
    }

    if (formattedValue.length > 5) {
      formattedValue = formattedValue.substring(0, 5) + '/' + formattedValue.substring(5);
    }

    if (formattedValue.length >= 2) {
      String day = formattedValue.substring(0, 2);
      if (int.parse(day) > 31) {
        day = '31';
      }
      formattedValue = day + formattedValue.substring(2);
    }

    if (formattedValue.length >= 5) {
      String month = formattedValue.substring(3, 5);
      if (int.parse(month) > 12) {
        month = '12';
      }
      formattedValue = formattedValue.substring(0, 3) + month + formattedValue.substring(5);
    }

    if (formattedValue.length >= 8) {
      String year = formattedValue.substring(6, 10);
      if (int.parse(year) < 1940) {
        year = '1940';
      } else if (int.parse(year) > 2010) {
        year = '2010';
      }
      formattedValue = formattedValue.substring(0, 6) + year;
    }

    return formattedValue;
  }

  Widget _buildNextButton(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      color: myRedColor,
      child: MaterialButton(
        onPressed: () {
          if (_areAllFieldsFilled() && _validateRegex()) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondFormular()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Please fill out all fields correctly.'),
              ),
            );
          }
        },
        minWidth: 350,
        height: 60,
        child: const Text(
          'Next',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  bool _areAllFieldsFilled() {
    return _firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _dobController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _mobileNumberController.text.isNotEmpty;
  }

  bool _validateRegex() {
    return _validateEmailRegex() && _validateMobileNumberRegex();
  }

  bool _validateEmailRegex() {
    return RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(_emailController.text);
  }

  bool _validateMobileNumberRegex() {
    return true; // muss noch bearbeitet werden
  }
}

