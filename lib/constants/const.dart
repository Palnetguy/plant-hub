// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

const color1 = Color(0xFF017D87);
const color2 = Color(0xFF003D41);
const homecolor1 = Color(0xFF003F44);

const color3 = Color(0xFF04998F);
const textColor = Color(0xFF02C31F);
const textColor2 = Color(0xFFFFFFFF);
const buttonColor = Color(0xFF104B50);

const inputColor1 = Color(0xFFCECDCD);
const searchInputColor = Color(0xFFD1DCDD);
const searchInputTextColor = Color(0xFF104B50);
const errorColor = Color(0xFFEE0004);

class BackButtonWidget extends StatelessWidget {
  final VoidCallback? goBack;
  const BackButtonWidget({
    super.key,
    this.goBack,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // Navigator.pop(context);
        goBack!();
      },
      icon: const Icon(
        Icons.arrow_back,
        size: 24,
        color: Colors.white,
      ),
    );
  }
}

// valid email
bool isValidEmail(String email) {
  // Regular expression for email validation
  // This regex is a basic one and might not cover all cases
  // Feel free to use a more comprehensive regex for your needs
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
}

// good password
bool isGoodPassword(String password) {
  // Check if the password meets the criteria
  // At least 6 characters long
  // Contains at least one uppercase letter
  // Contains at least one lowercase letter
  // Contains at least one digit
  // Contains at least one special character
  final RegExp uppercaseRegex = RegExp(r'[A-Z]');
  final RegExp lowercaseRegex = RegExp(r'[a-z]');
  final RegExp digitRegex = RegExp(r'\d');
  final RegExp specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  return password.length >= 6 &&
      uppercaseRegex.hasMatch(password) &&
      lowercaseRegex.hasMatch(password) &&
      digitRegex.hasMatch(password) &&
      specialCharRegex.hasMatch(password);
}

// validate number
bool isValidPhoneNumber(String phoneNumber) {
  // Regular expression for basic phone number validation
  // This regex allows for phone numbers with optional country code and area code
  final RegExp phoneRegex = RegExp(r'^\+?[1-9]\d{1,14}$');
  return phoneRegex.hasMatch(phoneNumber);
}
