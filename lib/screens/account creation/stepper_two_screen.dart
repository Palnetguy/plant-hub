import 'package:flutter/material.dart';
import 'package:plant_scan/controllers/auth_contoller.dart';

import '../../constants/const.dart';
import '../../widgets/custom_input_filed_widget.dart';
import '../../widgets/inputfield_module_number.dart';

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
    return AuthController().isValidEmail && AuthController().isValidPhoneNumber;
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
