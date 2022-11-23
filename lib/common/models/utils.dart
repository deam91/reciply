import 'package:flutter/material.dart';

class Validator {
  static String? isNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  static String? isValidEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email address is required';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.! #$%&'*+/=? ^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$")
        .hasMatch(value)) {
      return 'Email address is wrong';
    }
    return null;
  }

  static String? passwordEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password required';
    }
    return null;
  }

  static String? isValidPassWord(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password can not be empty';
    }
    if (value.length < 8) {
      return 'Password is too short. Minimum 8 characters required';
    }
    if (!RegExp(
            '^(?=.{8,32}\$)(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%^&*(),.?:{}|<>]).*')
        .hasMatch(value)) {
      return 'Password must contain uppercase and lowercase letters, numbers and special characters';
    }
    return null;
  }

  static String? isValidPassWordConfirmation(
      String? password, String? confirmation) {
    final text = Validator.isValidPassWord(password);
    if (text != null) return 'Password field must be valid';
    if (text == null && password != confirmation) {
      return 'Your password and confirmation must match';
    }
    return null;
  }
}

showSnackBarMessage(BuildContext context, String message,
    {String? description}) {
  var snackBar = SnackBar(
    duration: const Duration(seconds: 4),
    backgroundColor: Colors.black,
    elevation: 2,
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
    behavior: SnackBarBehavior.floating,
    content: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message),
          Text(description ?? ''),
        ],
      ),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

extension CapitalString on String {
  capitalize() {
    return this[0].toUpperCase() + substring(1);
  }
}
