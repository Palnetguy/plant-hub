import 'package:plant_scan/constants/const.dart';
import 'package:plant_scan/screens/WelcomeScreen.dart';
import 'package:plant_scan/screens/account%20creation/acount_creation.dart';
import 'package:plant_scan/screens/account%20creation/successfully_created_account.dart';
import 'package:plant_scan/screens/agentChat.dart';
import 'package:plant_scan/screens/aiChat.dart';
import 'package:plant_scan/screens/feedBackScreen.dart';
import 'package:plant_scan/screens/forgot%20password/forgot_password.dart';
import 'package:plant_scan/screens/homeScreen.dart';
import 'package:plant_scan/screens/loginScreen.dart';
import 'package:plant_scan/screens/plantDetailsScreen.dart';
import 'package:plant_scan/screens/searchFunctionScreen.dart';
import 'package:plant_scan/screens/settings.dart';
import 'package:plant_scan/screens/userProfile.dart';
import 'package:plant_scan/screens/yourSavesScreen.dart';
import 'package:plant_scan/widgets/ScreenNavLayout.dart';

import 'package:flutter/material.dart';

import 'screens/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
