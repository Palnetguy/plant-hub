// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:plant_scan/controllers/auth_contoller.dart';
import 'package:plant_scan/screens/account%20creation/acount_creation.dart';
import 'package:plant_scan/widgets/custom_password_inputs_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:plant_scan/constants/const.dart';

import '../../widgets/custom_input_filed_widget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  int _currentStep = 0;

  void _goToNext() {
    setState(() {
      _currentStep += 1;
    });
  }

  void _goBack() {
    setState(() {
      _currentStep -= 1;
    });
  }

  String setOneTitle = 'Forgot Password';
  String setOneInfo =
      'No worries! Enter your email address below and we will send you a code to reset your password.';

  String setTwoTitle = 'Verify Account';
  String setTwoInfo =
      'Code has been sent to rex23@yahoo.com. Enter the code to verify your account. ';

  String setThreeTitle = 'Create New Password';
  String setThreeInfo =
      'Please enter and confirm your new password. You will need to login after you reset.  ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // back button
                IconButton(
                  onPressed: () {
                    if (_currentStep <= 0) {
                      Navigator.pop(context);
                    } else {
                      _goBack();
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    size: 24,
                    color: buttonColor,
                  ),
                ),

                // text-info
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            _currentStep == 0
                                ? setOneTitle
                                : _currentStep == 1
                                    ? setTwoTitle
                                    : setThreeTitle,
                            style: const TextStyle(
                              fontSize: 24,
                              color: buttonColor,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              _currentStep == 0
                                  ? setOneInfo
                                  : _currentStep == 1
                                      ? setTwoInfo
                                      : setThreeInfo,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Color(0xFFB6B6B6),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),

                      // forms
                      _currentStep == 0
                          ? StepOneForgotPassword(
                              goToNext: _goToNext,
                            )
                          : const SizedBox(),
                      _currentStep == 1
                          ? StepTwoForgotPassword(goToNext: _goToNext)
                          : const SizedBox(),
                      _currentStep == 2
                          ? const StepThreeForgotPassword()
                          : const SizedBox(),

                      //
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StepOneForgotPassword extends StatefulWidget {
  final VoidCallback goToNext;

  const StepOneForgotPassword({
    super.key,
    required this.goToNext,
  });

  @override
  State<StepOneForgotPassword> createState() => _StepOneForgotPasswordState();
}

class _StepOneForgotPasswordState extends State<StepOneForgotPassword> {
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        InputFieldModule(
          icon: Icons.email_outlined,
          placeholder: 'Email',
          errorText: 'please fill in the field', // this one is optional if need
          onChanged: (value) {
            setState(() {
              email = value;
              // more validation here
            });
          },
        ),
        const SizedBox(
          height: 100,
        ),
        GestureDetector(
          onTap: () {
            // validate here
            if (AuthController().isValidEmail) {
              widget.goToNext();
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              color: !AuthController().isValidEmail
                  ? buttonColor.withOpacity(.3)
                  : buttonColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text(
              'Send Code',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class StepTwoForgotPassword extends StatefulWidget {
  final VoidCallback goToNext;
  const StepTwoForgotPassword({
    super.key,
    required this.goToNext,
  });

  @override
  State<StepTwoForgotPassword> createState() => _StepTwoForgotPasswordState();
}

class _StepTwoForgotPasswordState extends State<StepTwoForgotPassword> {
  String pin = '';

  bool isValidPin(String pin) {
    return pin.length == 5;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 35,
                  bottom: 10,
                ),
                child: const Text(
                  'Enter Code',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: buttonColor,
                  ),
                ),
              ),
            ],
          ),
          PinCodeTextField(
            appContext: context,
            length: 5, // Number of digits in the OTP
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                pin = value;
              });
            },
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 50,
              activeColor: buttonColor,
              selectedColor: buttonColor.withOpacity(.9),
              inactiveColor: const Color(0xFFB6B6B6),
            ),
            textStyle: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w400,
              color: buttonColor,
            ),
          ),
          const SizedBox(
            height: 100,
          ),

          // RESEND CODE AND TIME

          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't recieve code? ",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFB6B6B6),
                    ),
                  ),
                  Container(
                    child: const Text(
                      "Resent Code",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: buttonColor,
                        decoration: TextDecoration.underline,
                        decorationColor: buttonColor,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Resend code in  ",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFB6B6B6),
                    ),
                  ),
                  Container(
                    child: const Text(
                      "00:36",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: buttonColor,
                        decoration: TextDecoration.underline,
                        decorationColor: buttonColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // BUTTON
          GestureDetector(
            onTap: () {
              if (isValidPin(pin)) {
                widget.goToNext();
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                color: !isValidPin(pin)
                    ? buttonColor.withOpacity(.3)
                    : buttonColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                'Send Code',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StepThreeForgotPassword extends StatefulWidget {
  const StepThreeForgotPassword({super.key});

  @override
  State<StepThreeForgotPassword> createState() =>
      _StepThreeForgotPasswordState();
}

class _StepThreeForgotPasswordState extends State<StepThreeForgotPassword> {
  String newPass = '';
  String confirmPass = '';

  bool isValidToConfirm(String newPass, String confirmPass) {
    return ((newPass == confirmPass) &&
        (newPass.length >= 6) &&
        (confirmPass.length >= 6));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        InputFieldModulePasswordWithLable(
          lable: 'New Password',
          placeholder: 'Enter password',
          errorText: 'please fill in the field', // this one is optional if need
          onChanged: (value) {
            setState(() {
              newPass = value;
            });
          },
        ),
        InputFieldModulePasswordWithLable(
          placeholder: 'Enter password',
          errorText: 'please fill in the field', // this one is optional if need
          lable: 'Confirm Password',
          onChanged: (value) {
            setState(() {
              confirmPass = value;
            });
          },
        ),
        const SizedBox(
          height: 100,
        ),
        GestureDetector(
          onTap: () {},
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              color: !isValidToConfirm(newPass, confirmPass)
                  ? buttonColor.withOpacity(.3)
                  : buttonColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text(
              'Send Code',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
