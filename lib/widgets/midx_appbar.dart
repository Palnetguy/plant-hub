// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class MidxAppbar extends StatelessWidget {
  final String title;
  final VoidCallback? goBack;
  final bool? isStandAlone;
  const MidxAppbar({
    super.key,
    required this.title,
    this.goBack,
    this.isStandAlone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: Color(0xFF104B50),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    goBack!();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                )
              ],
            ),

            // extra icon
          ],
        ),
      ),
    );
  }
}
