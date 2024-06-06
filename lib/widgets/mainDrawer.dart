// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plant_scan/screens/loginScreen.dart';
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

             Footer()
          ],
        ),
      ),
    );
  }
  
}

// drawerHeader
class DrawerHaader extends StatelessWidget {
  const DrawerHaader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // bgimage
        Container(
          width: double.infinity,
          height: 171,
          // color: Colors.red,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/Frame 18145.png'),
            ),
          ),
        ),

        // info
        Container(
          width: double.infinity,
          height: 171,
          color: bgForDrawer.withOpacity(.8),
          child: Row(
            children: [
              // profileImage
              Container(
                margin: const EdgeInsets.only(left: 30),
                width: 109,
                height: 109,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/unnamed.jpg'),
                  ),
                ),
              ),

              // info
              Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // name
                    const Text(
                      'Masaba Ian',
                      style: TextStyle(
                        color: textColorForDrawer,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // email
                    const Text(
                      'masabaian332@gmail.com',
                      style: TextStyle(
                        color: textColorForDrawer,
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    // editbutton
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: textColorForDrawer,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(
                            color: bgForDrawer,
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

// eachTabModule
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

// FOOTER

class Footer extends StatelessWidget {
  final _firebaseAuth = FirebaseAuth.instance;

  Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // logoutButton
          Container(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
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
                TextButton(
                  onPressed: () => logout(context),
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

  logout(BuildContext context) async {
    await _firebaseAuth.signOut().then((user) => Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen())));
  }
}
