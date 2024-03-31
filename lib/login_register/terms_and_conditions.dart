import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';
import 'package:redresq_app/components/my_headers.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

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
              'Terms and Conditions',
              style: headerTextStyle.copyWith(fontSize: screenHeight * 0.035),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Read the text below',
              style: subHeaderTextStyle.copyWith(fontSize: screenHeight * 0.02),
            ),
            Text(
              'Privacy policy for the RedResQ app:\n'
              'Thank you for using the RedResQ App. This Privacy Policy is designed to help you understand what information we collect, why we collect it and how we use it. Your privacy is of the utmost importance to us and we do everything we can to protect your personal data.\n\n'
              'Data collected:\n'
              'a. Personal Information: The RedResQ App collects and stores personal information such as gender, home address, names, age and email addresses that you voluntarily provide to us.\n'
              'b. Quiz results: We store the results of the quizzes you take in order to provide you with a personalised experience and better services.\n'
              'c. Location data: The App may collect your location in order to provide you with location-based services. However, this data is not stored permanently and is only used to better help you in certain situations.\n\n'
              'Use of the data:\n'
              'a. We use your personal data to offer you personalised services and to provide you with a better user experience.\n'
              'b. Quiz results are used to assess your knowledge and provide you with appropriate feedback and recommendations.\n'
              'c. Location data is used to provide you with faster assistance in an emergency.\n\n'
              'Data security:\n'
              'a. We take appropriate security measures to protect your personal data from loss, misuse or unauthorised access.\n'
              'b. Access to your data is only permitted to authorised persons who require this information for the provision of services.\n\n'
              'Disclosure of data:\n'
              'a. Your personal information will not be shared with third parties unless required by law or necessary to provide services under the App.\n'
              'b. We do not sell, rent or trade your personal data with third parties for marketing purposes or for any other reason.\n\n'
              'Changes to the Privacy Policy:\n'
              'This Privacy Policy may be updated from time to time to reflect changes in our privacy practices. We encourage you to periodically review this page to stay informed of changes.\n\n'
              'By using the RedResQ App, you agree to the terms of this Privacy Policy. If you have any questions or concerns about our privacy practices, please contact us at [insert contact information].\n\n'
              'Last updated: 19.3.2024\n'
              'Thank you for your trust in the RedResQ App!',
              style: subHeaderTextStyle.copyWith(fontSize: screenHeight * 0.02),
            ),
          ],
        ),
      ),
    ));
  }
}
