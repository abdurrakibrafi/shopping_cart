import 'package:flutter/material.dart';

class Constant {
  static void showSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content:
          Text('Congratulations! Your order has been placed successfully.'),
      duration: Duration(seconds: 3), // Adjust the duration as needed
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
