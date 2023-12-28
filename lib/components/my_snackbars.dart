import 'package:flutter/material.dart';
import 'package:redresq_app/components/my_colors.dart';

void showErrorSnackbar(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        errorMessage,
        style: TextStyle(
          color: myRedColor,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: myGreyColor,
      duration: Duration(seconds: 3),
      elevation: 8.0,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      /*action: SnackBarAction(
        label: 'OK',
        onPressed: () {
          // Kann noch Inhalt kommen
        },
      ),*/
    ),
  );
}

