// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:plant_scan/constants/const.dart';
import 'package:plant_scan/controllers/auth_contoller.dart';

import '../../widgets/inputfield_module_number.dart';
import '../../widgets/step_circle_widget.dart';
import 'stepper_one_screen.dart';
import 'stepper_three_screen.dart';
import 'stepper_two_screen.dart';

class AccountCreation extends StatefulWidget {
  const AccountCreation({super.key});

  @override
  State<AccountCreation> createState() => _AccountCreationState();
}

class _AccountCreationState extends State<AccountCreation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<AuthController>(
            init: AuthController(),
            builder: (ctrl) {
              return ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // back button
                      IconButton(
                        onPressed: () {
                          ctrl.currentStep <= 0
                              ? Navigator.pop(context)
                              : setState(
                                  () {
                                    ctrl.currentStep -= 1;
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
                                      image:
                                          AssetImage('assets/images/logo.png'),
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
                                        isSelected: ctrl.currentStep == 0
                                            ? true
                                            : false,
                                      ),
                                      const TheSelectLine(),
                                      StepCircle(
                                        isSelected: ctrl.currentStep == 1
                                            ? true
                                            : false,
                                      ),
                                      const TheSelectLine(),
                                      StepCircle(
                                        isSelected: ctrl.currentStep == 2
                                            ? true
                                            : false,
                                      ),
                                    ],
                                  ),
                                  // step text
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Step ${ctrl.currentStep == 0 ? 'one' : ctrl.currentStep == 1 ? 'two' : 'three'}',
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
                                      ' ${ctrl.currentStep == 0 ? ' Please fill in the necessary details to continue.' : ctrl.currentStep == 1 ? 'Enter email and phone number to send one time password' : 'We have sent the verification code to your email address'}',
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
                              ctrl.currentStep == 0
                                  ? StepOneCreateAccount(
                                      goToNext: () {
                                        setState(() {
                                          ctrl.currentStep = 1;
                                        });
                                      },
                                    )
                                  : const SizedBox(),
                              ctrl.currentStep == 1
                                  ? StepTwoCreateAccount(
                                      goToNext: () {
                                        setState(() {
                                          ctrl.currentStep = 2;
                                        });
                                      },
                                    )
                                  : const SizedBox(),
                              ctrl.currentStep == 2
                                  ? const StepThreeCreateAccount()
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
