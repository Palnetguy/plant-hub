import 'package:flutter/material.dart';

import '../../constants/const.dart';

class SuccessfullCreation extends StatelessWidget {
  const SuccessfullCreation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // success tick
              Container(
                width: 106,
                height: 106,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: buttonColor,
                    width: 3,
                  ),
                ),
                child: const Icon(
                  Icons.done,
                  color: buttonColor,
                  size: 31,
                ),
              ),
              // info
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Success!',
                style: TextStyle(
                  color: buttonColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Congratulations! You have been successfully authenticated',
                style: TextStyle(
                  color: Color(0xFFB6B6B6),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),

              // button
              const SizedBox(
                height: 35,
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
