// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:plant_scan/screens/account%20creation/successfully_created_account.dart';
import 'package:plant_scan/widgets/custom_password_inputs_widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:plant_scan/constants/const.dart';

class AccountCreation extends StatefulWidget {
  const AccountCreation({super.key});

  @override
  State<AccountCreation> createState() => _AccountCreationState();
}

class _AccountCreationState extends State<AccountCreation> {
  int _currentStep = 0;

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
                    _currentStep <= 0
                        ? Navigator.pop(context)
                        : setState(
                            () {
                              _currentStep -= 1;
                            },
                          );
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    size: 24,
                    color: buttonColor,
                  ),
                ),
                // heading
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        // --logo
                        Container(
                          width: 133.15,
                          height: 133.15,
                          // color: Colors.red,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/logo.png'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const Text(
                          'Plant scan',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: buttonColor,
                          ),
                        ),
                        // Title - it changes acording to step
                        Column(
                          children: [
                            // title
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              child: const Text(
                                'CREATE ACCOUNT',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: buttonColor,
                                ),
                              ),
                            ),
                            // stepper
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                StepCircle(
                                  isSelected: _currentStep == 0 ? true : false,
                                ),
                                const TheSelectLine(),
                                StepCircle(
                                  isSelected: _currentStep == 1 ? true : false,
                                ),
                                const TheSelectLine(),
                                StepCircle(
                                  isSelected: _currentStep == 2 ? true : false,
                                ),
                              ],
                            ),
                            // step text
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                'Step ${_currentStep == 1 ? 'one' : _currentStep == 2 ? 'two' : 'three'}',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w300,
                                    color: const Color(0xFF002629)
                                        .withOpacity(.61)),
                              ),
                            ),
                            // the to do text
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              width: 271,
                              child: Text(
                                ' ${_currentStep == 0 ? ' Please fill in the necessary details to continue.' : _currentStep == 1 ? 'Enter email and phone number to send one time password' : 'We have sent the verification code to your email address'}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFB6B6B6),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // steps
                        _currentStep == 0
                            ? StepOneCreateAccount(
                                goToNext: () {
                                  setState(() {
                                    _currentStep = 1;
                                  });
                                },
                              )
                            : const SizedBox(),
                        _currentStep == 1
                            ? StepTwoCreateAccount(
                                goToNext: () {
                                  setState(() {
                                    _currentStep = 2;
                                  });
                                },
                              )
                            : const SizedBox(),
                        _currentStep == 2
                            ? const StepThreeCreateAccount()
                            : const SizedBox(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StepThreeCreateAccount extends StatefulWidget {
  const StepThreeCreateAccount({super.key});

  @override
  State<StepThreeCreateAccount> createState() => _StepThreeCreateAccountState();
}

class _StepThreeCreateAccountState extends State<StepThreeCreateAccount> {
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
          GestureDetector(
            onTap: () {
              if (isValidPin(pin)) {
                // widget.goToNext();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SuccessfullCreation(),
                  ),
                );
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

class StepTwoCreateAccount extends StatefulWidget {
  final VoidCallback? goToNext;
  const StepTwoCreateAccount({
    super.key,
    this.goToNext,
  });

  @override
  State<StepTwoCreateAccount> createState() => _StepTwoCreateAccountState();
}

class _StepTwoCreateAccountState extends State<StepTwoCreateAccount> {
  String email = '';
  String phoneNumber = '';

  bool _isValidToConfirm(String email, String phoneNumber) {
    return isValidEmail(email) && isValidPhoneNumber(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputFieldModule(
          icon: Icons.email_outlined,
          placeholder: 'Email',
          errorText: 'please fill in the field', // this one is optional if need
          onChanged: (value) {
            setState(() {
              email = value;
            });
          },
        ),
        InputFieldModuleNumber(
          icon: Icons.email_outlined,
          placeholder: 'Phone number',
          errorText: 'please fill in the field', // this one is optional if need
          // thereIsError: true,
          onChanged: (value) {
            setState(() {
              phoneNumber = value;
            });
          },
        ),
        GestureDetector(
          onTap: () {
            if (_isValidToConfirm(email, phoneNumber)) {
              widget.goToNext!();
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              color: !_isValidToConfirm(email, phoneNumber)
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

class StepOneCreateAccount extends StatefulWidget {
  final VoidCallback? goToNext;
  const StepOneCreateAccount({
    super.key,
    this.goToNext,
  });

  @override
  State<StepOneCreateAccount> createState() => _StepOneCreateAccountState();
}

class _StepOneCreateAccountState extends State<StepOneCreateAccount> {
  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

// validation
// check password
  bool _isValidPassword(String password, String confirmPassword) {
    return ((password == confirmPassword) &&
        (password.length >= 6) &&
        (confirmPassword.length >= 6));
  }

// check the whole thing
  bool _isValidToCreateAccount({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    return name.isNotEmpty &&
        isValidEmail(email) &&
        _isValidPassword(password, confirmPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputFieldModule(
          icon: Icons.person_outline_rounded,
          placeholder: 'Name',
          errorText: 'please fill in the field', // this one is optional if need
          onChanged: (value) {
            setState(() {
              name = value;
            });
          },
        ),
        InputFieldModule(
          icon: Icons.email_outlined,
          placeholder: 'Email',
          errorText: 'please fill in the field', // this one is optional if need
          onChanged: (value) {
            setState(() {
              email = value;
            });
          },
        ),
        InputFieldModulePasswordNoLable(
          placeholder: 'Enter password',
          errorText: 'please fill in the field', // this one is optional if need
          onChanged: (value) {
            setState(() {
              password = value;
            });
          },
        ),
        InputFieldModulePasswordNoLable(
          placeholder: 'Confirm password',
          errorText: 'please fill in the field', // this one is optional if need
          onChanged: (value) {
            setState(() {
              confirmPassword = value;
            });
          },
        ),
        // text button
        GestureDetector(
          onTap: () {
            if (_isValidToCreateAccount(
              name: name,
              email: email,
              password: password,
              confirmPassword: confirmPassword,
            )) {
              widget.goToNext!();
            }
            // setState() {
            // }
            // Navigator.pop(context);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              color: !_isValidToCreateAccount(
                name: name,
                email: email,
                password: password,
                confirmPassword: confirmPassword,
              )
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

        // terms etc......

        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'By continuing, you agree to our ',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF475569),
                  ),
                ),
                Container(
                  child: const Text(
                    'Terms of Service',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF104B50),
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF104B50),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'and ',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF475569),
                  ),
                ),
                Container(
                  child: const Text(
                    'Privacy Policy',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF104B50),
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF104B50),
                    ),
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}

// inputText Module
class InputFieldModule extends StatefulWidget {
  final String placeholder;
  final dynamic icon;
  bool? thereIsError = false;
  String? errorText = '';

  final ValueChanged<String>? onChanged;

  InputFieldModule({
    super.key,
    required this.placeholder,
    required this.icon,
    this.thereIsError = false,
    this.errorText = '',
    this.onChanged,
  });

  @override
  State<InputFieldModule> createState() => _InputFieldModuleState();
}

class _InputFieldModuleState extends State<InputFieldModule> {
  bool isFilled = false;

  String textEntered = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          TextField(
            onChanged: (value) {
              widget.onChanged?.call(value);
              setState(() {
                textEntered = value;
              });
            },
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: color1,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              prefixIcon: Icon(
                widget.icon,
                size: 22,
                color: widget.thereIsError!
                    ? errorColor
                    : textEntered.isNotEmpty
                        ? buttonColor
                        : inputColor1,
              ),
              hintText: widget.placeholder,
              hintStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: widget.thereIsError!
                    ? errorColor
                    : textEntered.isNotEmpty
                        ? buttonColor
                        : inputColor1,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: widget.thereIsError!
                      ? errorColor
                      : textEntered.isNotEmpty
                          ? buttonColor
                          : inputColor1,
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

          // Error text
          widget.thereIsError!
              ? Row(
                  children: [
                    Text(
                      widget.errorText!,
                      style: const TextStyle(
                        color: errorColor,
                        fontSize: 11,
                      ),
                    ),
                  ],
                )
              : const SizedBox()
        ],
      ),
    );
  }
}

// inputNumber Module
class InputFieldModuleNumber extends StatefulWidget {
  final String placeholder;
  final dynamic icon;
  bool? thereIsError = false;
  String? errorText = '';

  final ValueChanged<String>? onChanged;

  InputFieldModuleNumber({
    super.key,
    required this.placeholder,
    required this.icon,
    this.thereIsError = false,
    this.errorText = '',
    this.onChanged,
  });

  @override
  State<InputFieldModuleNumber> createState() => _InputFieldModuleNumberState();
}

class _InputFieldModuleNumberState extends State<InputFieldModuleNumber> {
  bool isFilled = false;

  String textEntered = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          IntlPhoneField(
            // decoration: const InputDecoration(
            //
            //   border: OutlineInputBorder(
            //     borderSide: BorderSide(),
            //   ),
            // ),

            initialCountryCode: 'UG',
            onChanged: (phone) {
              // print(phone.completeNumber);
              setState(() {
                textEntered = phone.completeNumber;
              });

              widget.onChanged?.call(phone.completeNumber);
            },

            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: color1,
            ),
            decoration: InputDecoration(
              // labelText: 'Phone Number',
              contentPadding: const EdgeInsets.all(15),
              prefixIcon: Icon(
                widget.icon,
                size: 22,
                color: widget.thereIsError!
                    ? errorColor
                    : textEntered.isNotEmpty
                        ? buttonColor
                        : inputColor1,
              ),
              hintText: widget.placeholder,
              hintStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: widget.thereIsError!
                    ? errorColor
                    : textEntered.isNotEmpty
                        ? buttonColor
                        : inputColor1,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: widget.thereIsError!
                      ? errorColor
                      : textEntered.isNotEmpty
                          ? buttonColor
                          : inputColor1,
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

          // Error text
          widget.thereIsError!
              ? Row(
                  children: [
                    Text(
                      widget.errorText!,
                      style: const TextStyle(
                        color: errorColor,
                        fontSize: 11,
                      ),
                    ),
                  ],
                )
              : const SizedBox()
        ],
      ),
    );
  }
}

// the select line
class TheSelectLine extends StatelessWidget {
  const TheSelectLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 2.5,
      color: buttonColor,
    );
  }
}

// the select cicle
class StepCircle extends StatelessWidget {
  bool isSelected = false;
  StepCircle({
    super.key,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0, 0),
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(10),
          width: 50 / 4,
          height: 50 / 4,
          decoration: BoxDecoration(
            color: isSelected ? buttonColor : Colors.transparent,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: 45 / 4,
          height: 45 / 4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: 25 / 4,
          height: 25 / 4,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ],
    );
  }
}
