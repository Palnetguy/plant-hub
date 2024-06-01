import 'package:flutter/widgets.dart';
import 'package:plant_scan/constants/const.dart';
import 'package:flutter/material.dart';

class InputFieldModulePasswordWithLable extends StatefulWidget {
  final String placeholder;

  bool? thereIsError = false;
  String? errorText = '';
  final String lable;

  // Function(String)? onChange;
  final ValueChanged<String>? onChanged;

  InputFieldModulePasswordWithLable({
    super.key,
    required this.placeholder,
    this.thereIsError = false,
    this.errorText = '',
    required this.lable,
    this.onChanged,
  });

  @override
  State<InputFieldModulePasswordWithLable> createState() =>
      _InputFieldModulePasswordWithLableState();
}

class _InputFieldModulePasswordWithLableState
    extends State<InputFieldModulePasswordWithLable> {
  bool isFilled = false;
  bool _obstractText = false;
  String textEntered = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.lable,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: buttonColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            obscureText: _obstractText,
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
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obstractText = !_obstractText;
                  });
                },
                icon: Icon(
                  size: 22,
                  color: widget.thereIsError!
                      ? errorColor
                      : textEntered.isNotEmpty
                          ? buttonColor
                          : inputColor1,
                  _obstractText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              ),
              hintText: widget.placeholder,
              hintStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: widget.thereIsError!
                    ? errorColor.withOpacity(.4)
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

// pass
class InputFieldModulePasswordNoLable extends StatefulWidget {
  final String placeholder;
  TextEditingController? controller;
  bool? thereIsError = false;
  String? errorText = '';

  // Function(String)? onChange;
  final ValueChanged<String>? onChanged;

  InputFieldModulePasswordNoLable({
    this.controller,
    super.key,
    required this.placeholder,
    this.thereIsError = false,
    this.errorText = '',
    this.onChanged,
  });

  @override
  State<InputFieldModulePasswordNoLable> createState() =>
      _InputFieldModulePasswordNoLableState();
}

class _InputFieldModulePasswordNoLableState
    extends State<InputFieldModulePasswordNoLable> {
  bool isFilled = false;
  bool _obstractText = false;
  String textEntered = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          TextField(
            obscureText: _obstractText,
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
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obstractText = !_obstractText;
                  });
                },
                icon: Icon(
                  size: 22,
                  color: widget.thereIsError!
                      ? errorColor
                      : textEntered.isNotEmpty
                          ? buttonColor
                          : inputColor1,
                  _obstractText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              ),
              hintText: widget.placeholder,
              hintStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: widget.thereIsError!
                    ? errorColor.withOpacity(.4)
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
