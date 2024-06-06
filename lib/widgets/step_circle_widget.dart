import 'package:flutter/material.dart';

import '../constants/const.dart';

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
