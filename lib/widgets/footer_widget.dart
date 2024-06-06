// FOOTER

import 'package:flutter/material.dart';
import 'package:plant_scan/controllers/auth_contoller.dart';

import 'mainDrawer.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // logoutButton
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
              color: textColorForDrawer,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                // icon
                const Icon(
                  Icons.logout_outlined,
                  size: 24,
                  color: bgForDrawer,
                ),
                // text
                GestureDetector(
                  onTap: () {
                    AuthController().signOut();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 15 / 2),
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                        color: bgForDrawer,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          // app version
          const Text(
            'App ver 1.0',
            style: TextStyle(
              color: textColorForDrawer,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
