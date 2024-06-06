import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../constants/const.dart';

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
