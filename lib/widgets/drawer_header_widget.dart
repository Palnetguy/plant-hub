// drawerHeader
import 'package:flutter/material.dart';

import 'mainDrawer.dart';

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
