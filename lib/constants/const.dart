// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

const color1 = Color(0xFF017D87);
const color2 = Color(0xFF003D41);
const homecolor1 = Color(0xFF003F44);

const color3 = Color(0xFF04998F);
const textColor = Color(0xFF02C31F);
const textColor2 = Color(0xFFFFFFFF);
const buttonColor = Color(0xFF104B50);

const inputColor1 = Color(0xFFCECDCD);
const searchInputColor = Color(0xFFD1DCDD);
const searchInputTextColor = Color(0xFF104B50);
const errorColor = Color(0xFFEE0004);

class BackButtonWidget extends StatelessWidget {
  final VoidCallback? goBack;
  const BackButtonWidget({
    super.key,
    this.goBack,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // Navigator.pop(context);
        goBack!();
      },
      icon: const Icon(
        Icons.arrow_back,
        size: 24,
        color: Colors.white,
      ),
    );
  }
}
