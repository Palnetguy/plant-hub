// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plant_scan/screens/account%20creation/acount_creation.dart';
import 'package:plant_scan/screens/homeScreen.dart';
import 'package:plant_scan/screens/settings.dart';
import 'package:plant_scan/widgets/ScreenNavLayout.dart';
import 'package:plant_scan/widgets/custom_password_inputs_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:plant_scan/constants/const.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // header
          const HeaderForm(),

          // next... Form

          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: const [
                LoginForm(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  String email = '';
  String password = '';

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  // validation
// check password
  bool _isValidPassword(String password) {
    return (password.length >= 6);
  }

  // // check the whole thing
  bool _isValidToLogIn({
    required String email,
    required String password,
  }) {
    return isValidEmail(email) && _isValidPassword(password);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InputFieldModule(
            placeholder: 'Enter email',
            controller: _email,
            icon: Icons.email_outlined,
            onChanged: (value) {
              setState(() {
                email = value;
                _email.text = value;
              });
            },
          ),
          InputFieldModulePasswordNoLable(
            placeholder: 'Enter password',
            controller: _password,
            onChanged: (value) {
              setState(() {
                password = value;
                _password.text = value;
              });
            },
          ),
          const SizedBox(height: 10,),
          const Text(
            'Forgort password',
            // textAlign: TextAlign.end,
            style: TextStyle(
              color: color1,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
              decorationColor: color1,
            ),
          ),

          // button
          //  for login
          GestureDetector(
            onTap: () {
              if (_isValidToLogIn(email: email, password: password)) {
                login();
                // to home screen
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     // to main screen
                //     builder: (context) => const ScreenNavLayout(),
                //   ),
                // );
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              margin: const EdgeInsets.only(top: 35),
              padding: const EdgeInsets.symmetric(vertical: 12),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: !_isValidToLogIn(email: email, password: password)
                      ? buttonColor.withOpacity(.3)
                      : buttonColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: !_isValidToLogIn(email: email, password: password)
                        ? color1.withOpacity(.3)
                        : color1,
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

          // bisector

          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 2,
                    color: buttonColor,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: const Text(
                      'Or',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 2,
                    color: buttonColor,
                  ),
                ),
              ],
            ),
          ),
          // ---bs

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
                  color: buttonColor,
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
                  color: buttonColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  login() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
              email: _email.text, password: _password.text);
      // ignore: unnecessary_null_comparison
      if (userCredential != null) {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => const ScreenNavLayout(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('User not found'),
            backgroundColor: Colors.redAccent,
          ),
        );
      } else if (e.code == 'wrong-password') {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Password is incorrect'),
          backgroundColor: Colors.redAccent,
        ));
      }
    }
  }
}

class InputModal extends StatelessWidget {
  final placeholder;
  final icon;

  const InputModal({
    super.key,
    required this.placeholder,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: TextField(
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: color1,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          prefixIcon: Icon(
            icon,
            size: 22,
            color: inputColor1,
          ),
          hintText: placeholder,
          hintStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: inputColor1,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: inputColor1,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: color1,
              width: 2,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

class HeaderForm extends StatelessWidget {
  const HeaderForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: welcomeShape(),
      child: Container(
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF104B50).withOpacity(1),
              const Color(0xFF104B50).withOpacity(.9)
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 91,
                  height: 91,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
                const Text(
                  'WELCOME',
                  style: TextStyle(
                    color: textColor2,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  'BACK',
                  style: TextStyle(
                    color: textColor2,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
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

class welcomeShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0025000, size.height * -0.0039430);
    path_0.lineTo(size.width * 1.0027451, size.height * -0.0039430);
    path_0.lineTo(size.width * 1.0686362, size.height * 1.0889235);
    path_0.quadraticBezierTo(size.width * 1.0288250, size.height * 1.0153333,
        size.width * 0.9013250, size.height * 0.8699000);
    path_0.quadraticBezierTo(size.width * 0.7833750, size.height * 0.7602667,
        size.width * 0.5870500, size.height * 0.9265333);
    path_0.quadraticBezierTo(size.width * 0.4623500, size.height * 1.0265667,
        size.width * 0.2618000, size.height * 0.8708667);
    path_0.quadraticBezierTo(size.width * 0.0982250, size.height * 0.7140000,
        size.width * -0.0025000, size.height * 0.8752047);

    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
