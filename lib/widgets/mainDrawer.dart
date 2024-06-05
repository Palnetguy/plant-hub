// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:plant_scan/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'drawer_header_widget.dart';
import 'each_tab_module_widget.dart';
import 'footer_widget.dart';

const bgForDrawer = Color(0xFF003F44);
const textColorForDrawer = Color(0xFFFFFFFF);
// const bgForDrawer = Color(0xFF003F44);

class MainDrawer extends StatelessWidget {
  final Function(int)? drawerGoTo;
  const MainDrawer({
    super.key,
    this.drawerGoTo,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width - 25,
      backgroundColor: bgForDrawer,
      // drawer Here........
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // header
            DrawerHaader(),
            // middle tabs

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
                child: Column(
                  children: [
                    EachTabModule(
                      icon: Icons.home,
                      text: 'Home',
                      isFilled: true,
                      navigateTo: () {
                        Navigator.pop(context);
                      },
                    ),
                    EachTabModule(
                      icon: Icons.person_3_outlined,
                      text: 'Profile',
                      navigateTo: () {
                        if (drawerGoTo != null) {
                          drawerGoTo!(3);
                        }
                      },
                    ),
                    EachTabModule(
                      icon: Icons.save,
                      text: 'Saves',
                      navigateTo: () {
                        if (drawerGoTo != null) {
                          drawerGoTo!(2);
                        }
                      },
                    ),
                    EachTabModule(
                      icon: Icons.settings,
                      text: 'Settings',
                      navigateTo: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen(),
                          ),
                        );
                      },
                    ),
                    EachTabModule(
                      icon: Icons.live_help_outlined,
                      text: 'Help Center',
                    ),
                    EachTabModule(
                      icon: Icons.feedback_outlined,
                      text: 'About Us',
                    ),
                  ],
                ),
              ),
            ),

            // footer

            const Footer()
          ],
        ),
      ),
    );
  }
}
