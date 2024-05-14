// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:plant_scan/constants/const.dart';

class UserProfile extends StatelessWidget {
  final VoidCallback? goBack;
  const UserProfile({
    super.key,
    this.goBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // header
              Header(
                goBack: goBack,
              ),

              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  children: [
                    // bio
                    Bio(),
                    // change tabs
                    Column(
                      children: [
                        ChangeTabModal(
                          icon: Icons.image_outlined,
                          text: 'Change background picture',
                        ),
                        ChangeTabModal(
                          icon: Icons.co_present_rounded,
                          text: 'Change profile picture',
                        ),
                        ChangeTabModal(
                          icon: Icons.password_outlined,
                          text: 'Change password',
                        ),
                        ChangeTabModal(
                          icon: Icons.email_outlined,
                          text: 'Change email',
                        ),
                        ChangeTabModal(
                          icon: Icons.badge_outlined,
                          text: 'Change name',
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChangeTabModal extends StatelessWidget {
  final dynamic icon;
  final String text;
  const ChangeTabModal({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: const BoxDecoration(
          color: Color(0xFFEAEFEE),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 30, right: 35),
              child: Icon(
                icon,
                size: 24,
                color: const Color(0xFF292D32),
              ),
            ),
            Text(
              text,
              style: const TextStyle(
                color: buttonColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// bio
class Bio extends StatelessWidget {
  const Bio({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: const BoxDecoration(
          color: Color(0xFFEAEFEE),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title
            ClipPath(
              clipper: BioClipper(),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF003F44), Color(0xFF019DAA)],
                  ),
                ),
                child: const Text(
                  'Bio',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // bio txt
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim.',
                style: TextStyle(
                  fontSize: 11,
                  color: buttonColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
// Bio cliper

class BioClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0016667, size.height * -0.0033333);
    path_0.lineTo(size.width * 1.0016667, size.height * -0.0033333);
    path_0.lineTo(size.width * 0.6983333, size.height * 1.0066667);
    path_0.lineTo(size.width * -0.0116667, size.height * 1.0233333);

    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// end  Bio cliper

class Header extends StatelessWidget {
  final VoidCallback? goBack;
  const Header({
    super.key,
    this.goBack,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // bg image
        Container(
          width: double.infinity,
          height: 338,
          // color: Colors.red,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(1),
                offset: const Offset(0, 5),
                blurRadius: 10,
              ),
            ],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/Frame 18145.png'),
            ),
          ),
        ),
        // info
        Container(
          width: double.infinity,
          height: 338,
          decoration: BoxDecoration(
            color: buttonColor.withOpacity(.8),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // top
                    BackButtonWidget(
                      goBack: goBack,
                    ),
                  ],
                ),

                // main info
                Column(
                  children: [
                    //  image
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/images/unnamed.jpg'),
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // name
                    const Text(
                      'Masaba Ian Samuel',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // email
                    const Text(
                      'masabaian332@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
