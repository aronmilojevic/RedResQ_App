import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/login_register/create_new_password.dart';

class ResetCodeInput extends StatefulWidget {
  final String email;

  const ResetCodeInput({Key? key, required this.email}) : super(key: key);

  @override
  _ResetCodeInputState createState() => _ResetCodeInputState();
}

class _ResetCodeInputState extends State<ResetCodeInput> {
  final List<TextEditingController> textControllers =
  List.generate(6, (_) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  String getVerificationCode() {
    return textControllers.map((controller) => controller.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              const Image(
                image: AssetImage('lib/assets/reset/code.png'),
                width: 650,
                height: 250,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 30),
              const Text(
                'Enter the code',
                style: TextStyle(
                  color: Color(0xff464444),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'A 6 digits code has been sent to \n ${widget.email}',
                style: TextStyle(
                  color: Color(0xff464444),
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  6,
                      (index) => SizedBox(
                    width: 50,
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xfff3f3f3),
                      child: TextField(
                        controller: textControllers[index],
                        onChanged: (value) {
                          if (value.length > 1) {
                            textControllers[index].text = value.substring(0, 1);
                          }

                          if (value.isNotEmpty && index < 5) {
                            FocusScope.of(context)
                                .requestFocus(focusNodes[index + 1]);
                          }
                        },
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: myRedColor,
                        ),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0x00000000)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0x00000000)),
                          ),
                          fillColor: Color(0xfff3f3f3),
                          alignLabelWithHint: true,
                        ),
                        focusNode: focusNodes[index],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Material(
                elevation: 5,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: myRedColor,
                child: MaterialButton(
                  onPressed: () {
                    String verificationCode = getVerificationCode();
                    print("Verification Code: $verificationCode");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateNewPassword(),
                      ),
                    );
                  },
                  minWidth: 350,
                  height: 60,
                  child: Text(
                    'Send',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
}
