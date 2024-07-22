import 'package:flutter/material.dart';

bool isLoad = false;
bool obscureText = true;
bool obscureText2 = true;
late bool isSideBarClosed;

extension ShowSnackBar on BuildContext {
  void showErrorMessage(BuildContext context,
      {required String message, required Color backgroundColor}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }

  void showSuccessMessage(BuildContext context,
      {required String message, required Color backgroundColor}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
    );
  }
}