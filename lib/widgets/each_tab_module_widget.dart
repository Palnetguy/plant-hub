// eachTabModule
import 'package:flutter/material.dart';

import 'mainDrawer.dart';

class EachTabModule extends StatelessWidget {
  final dynamic icon;
  final String text;
  bool isFilled = false;
  final VoidCallback? navigateTo;
  EachTabModule({
    super.key,
    required this.icon,
    required this.text,
    this.isFilled = false,
    this.navigateTo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo!();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: isFilled ? const Color(0xFF017D87) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            // icon
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Icon(
                icon,
                size: 24,
                color: textColorForDrawer,
              ),
            ),
            // text
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                text,
                style: const TextStyle(
                  color: textColorForDrawer,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
