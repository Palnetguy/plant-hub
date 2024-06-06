import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../constants/const.dart';
import 'successfully_created_account.dart';

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
