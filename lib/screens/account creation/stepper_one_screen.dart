import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_scan/controllers/auth_contoller.dart';

import '../../constants/const.dart';
import '../../widgets/custom_input_filed_widget.dart';
import '../../widgets/custom_password_inputs_widgets.dart';

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
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (authctrl) {
          return Column(
            children: [
              InputFieldModule(
                icon: Icons.person_outline_rounded,
                placeholder: 'Full Name',
                controller: authctrl.name,
                thereIsError: authctrl.nameError,
                errorText:
                    authctrl.nameErrorText, // this one is optional if need
                onChanged: (value) {
                  authctrl.name.text = value;
                  authctrl.update();
                  authctrl.isValidNameFunc();
                },
              ),
              InputFieldModule(
                icon: Icons.email_outlined,
                placeholder: 'Email',
                controller: authctrl.email,
                thereIsError: authctrl.emailError,
                errorText:
                    authctrl.emailErrorText, // this one is optional if need
                onChanged: (value) {
                  authctrl.email.text = value;
                  authctrl.update();
                  authctrl.isValidEmailFunc();
                },
              ),
              InputFieldModulePasswordNoLable(
                placeholder: 'Enter password',
                controller: authctrl.password,
                thereIsError: authctrl.passwordError,
                errorText:
                    authctrl.passwordErrorText, // this one is optional if need
                onChanged: (value) {
                  authctrl.password.text = value;
                  authctrl.update();
                  authctrl.isValidPasswordFunc();
                },
              ),
              InputFieldModulePasswordNoLable(
                placeholder: 'Confirm password',
                controller: authctrl.confirmPassword,
                thereIsError: authctrl.passwordError,
                errorText:
                    authctrl.passwordErrorText, // this one is optional if need
                onChanged: (value) {
                  authctrl.confirmPassword.text = value;
                  authctrl.update();
                  authctrl.isValidPasswordFunc();
                },
              ),
              // text button
              GestureDetector(
                onTap: () {
                  authctrl.register();
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  margin: const EdgeInsets.only(top: 15),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                    color: !authctrl.isValidToCreateAccount()
                        ? buttonColor.withOpacity(.3)
                        : buttonColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    'Continue',
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
        });
  }
}
