// inputText Module
import 'package:plant_scan/constants/const.dart';
import 'package:flutter/material.dart';

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
