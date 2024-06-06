import 'package:plant_scan/constants/const.dart';
import 'package:plant_scan/screens/account%20creation/acount_creation.dart';
import 'package:plant_scan/screens/loginScreen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/welcome.png'),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF4A6349).withOpacity(0),
                  const Color(0xFF234E27).withOpacity(.89)
                ],
              ),
            ),

            // the Info in the screen
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                // For the text
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textAlign: TextAlign.left,
                      'Welcome to ',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 50,
                        color: textColor2,
                      ),
                    ),
                    Text(
                      'Plant Scan',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 34,
                        color: textColor2,
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: Text(
                        textAlign: TextAlign.left,
                        'your number one database for all flora.',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: textColor2,
                        ),
                      ),
                    ),
                  ],
                ),
                // for the buttons
                //  for login
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 35),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: color1,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: const Text(
                      'Log in',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: textColor2,
                      ),
                    ),
                  ),
                ),
                // for the buttons
                //  for resiser
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AccountCreation(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 40),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(.3),
                          Colors.white.withOpacity(.1)
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: const Text(
                      'Register',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: textColor2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
