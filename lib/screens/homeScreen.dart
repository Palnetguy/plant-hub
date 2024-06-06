// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:plant_scan/constants/const.dart';
import 'package:plant_scan/screens/searchFunctionScreen.dart';
import 'package:plant_scan/widgets/mainDrawer.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback? goToProfile;
  final Function()? drawerTo;
  const HomeScreen({
    super.key,
    this.goToProfile,
    this.drawerTo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        actions: [
          // profile pic

          GestureDetector(
            onTap: () {
              if (goToProfile != null) {
                goToProfile!();
              }
            },
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/images/unnamed.jpg'),
                ),
              ),
            ),
          )
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.only(left: 20),
              child: IconButton(
                padding: const EdgeInsets.all(0),
                icon: Icon(
                  Icons.menu_rounded, // Drawer icon
                  color: homecolor1, // Change the color of the drawer icon
                  size: 40,
                  weight: 900,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.1), // Shadow color
                      blurRadius: 5, // Blur radius
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Open the drawer
                },
              ),
            );
          },
        ),
      ),
      drawer: MainDrawer(
        drawerGoTo: drawerTo != null ? drawerTo!() : null,
      ),
      body: Container(
        color: Colors.white,

        // from search
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
          child: ListView(
            children: const [
              SearchArea(),
              Discover(),
              AlertForToday(),
            ],
          ),
        ),
      ),
    );
  }
}

class Discover extends StatelessWidget {
  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, top: 20),
          child: const Text(
            'Discover',
            style: TextStyle(
              color: buttonColor,
              fontSize: 36,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Shadow color
                blurRadius: 20, // Blur radius
                spreadRadius: 2, // Spread radius
                offset: const Offset(0, 2), // Offset from the widget
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/homeDiscover.jpeg'),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, right: 5),
                    width: 106,
                    child: const Text(
                      'The best database around that gives you access to information on over 1 million species of plants.',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 11,
                      ),
                    ),
                  ),
                  // the explore
                  ClipPath(
                    clipper: ExploreClipper(),
                    child: Container(
                      padding: const EdgeInsets.only(
                        right: 100,
                        left: 25,
                        top: 6.5,
                        bottom: 6.5,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFF003F44).withOpacity(1),
                            const Color(0xFF019DAA).withOpacity(.19),
                          ],
                        ),
                      ),
                      child: const Text(
                        'Explore',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

// the clipper for the home explore
class ExploreClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width * 1.0025000, 0);
    path_0.lineTo(size.width * 1.0025000, size.height);
    path_0.lineTo(size.width * 0.1247000, size.height * 0.9932000);

    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// search Are at the top

class SearchArea extends StatefulWidget {
  const SearchArea({
    super.key,
  });

  @override
  State<SearchArea> createState() => _SearchAreaState();
}

class _SearchAreaState extends State<SearchArea> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search_rounded,
                size: 26,
                color: searchInputTextColor,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10.5,
                horizontal: 35.5,
              ),
              filled: true,
              fillColor: searchInputColor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(100),
              ),
              hintText: 'Search for plant...',
              hintStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: searchInputTextColor,
              ),
            ),
          ),
        ),
        // button
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchFunctionScreen(),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 5),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: color1.withOpacity(0.2), // Shadow color
                  blurRadius: 3, // Blur radius
                  spreadRadius: 0, // Spread radius
                  offset: const Offset(0, 10), // Offset from the widget
                ),
                BoxShadow(
                  color: color1.withOpacity(0.1), // Shadow color
                  blurRadius: 10, // Blur radius
                  spreadRadius: 3, // Spread radius
                  offset: const Offset(0, 10), // Offset from the widget
                ),
              ],
            ),
            child: const Icon(
              Icons.track_changes_outlined,
              color: searchInputTextColor,
              size: 30,
            ),
          ),
        )
      ],
    );
  }
}

class AlertForToday extends StatelessWidget {
  const AlertForToday({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      child: Column(
        // header
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Alerts for today',
                  style: TextStyle(
                    color: buttonColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'View all',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: buttonColor,
                    color: buttonColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // alerts
          const AlertModal(),
          const AlertModal(),

          // Scan Button Modal
          const ScanButtonModal(),

          // popular plants
          const PopularPlants(),

          // categories
          const Categories(),
        ],
      ),
    );
  }
}

// alert modal
class AlertModal extends StatelessWidget {
  const AlertModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // image
          Container(
            width: 42.72,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(5),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/plant1.jpeg',
                ),
              ),
            ),
          ),
          // info
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // head
              Container(
                child: const Text(
                  'Water your Cactus today (living room)',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    color: buttonColor,
                  ),
                ),
              ),
              // c..
              Container(
                child: const Text(
                  'It’s 2 weeks old, you have to water it twice a w..',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xFf628093),
                  ),
                ),
              ),
            ],
          ),
          // nextIcon
          const Icon(Icons.arrow_forward_ios_rounded)
        ],
      ),
    );
  }
}

class ScanButtonModal extends StatelessWidget {
  const ScanButtonModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFEAEFEE),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.3),
            offset: const Offset(0, 5),
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.document_scanner_outlined,
            size: 24,
            color: buttonColor,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const Text(
              'Scan and identify the plant',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: buttonColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PopularPlants extends StatelessWidget {
  const PopularPlants({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular plants',
                style: TextStyle(
                  color: buttonColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'View all',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: buttonColor,
                  color: buttonColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PopularPlantEchModal(),
            PopularPlantEchModal(),
          ],
        )
      ],
    );
  }
}

class PopularPlantEchModal extends StatelessWidget {
  const PopularPlantEchModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // color: Color(0xFFF8F8F8),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // info
          Container(
            width: 90,
            child: const Column(
              children: [
                Text(
                  'Fits well',
                  style: TextStyle(
                    decorationColor: buttonColor,
                    color: buttonColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Peperomia Houseplant',
                  style: TextStyle(
                    decorationColor: buttonColor,
                    color: buttonColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          // image
          Container(
            width: 70,
            height: 117,
            decoration: BoxDecoration(
              // color: Colors.red,
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/plant1.jpeg',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Categories',
            style: TextStyle(
              color: buttonColor,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),

          // categs
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              EachCategoIcon(
                icon: Icons.eco,
                text: 'Herbs',
              ),
              EachCategoIcon(
                icon: Icons.park,
                text: 'Tree',
              ),
              EachCategoIcon(
                icon: Icons.spa,
                text: 'Fowers',
              ),
              EachCategoIcon(
                icon: Icons.diversity_2,
                text: 'Fruit',
              ),
            ],
          ),

          Container(
            margin: const EdgeInsets.only(bottom: 15, top: 15),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Alerts for today',
                  style: TextStyle(
                    color: Color(0xFF406F72),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'View all',
                      style: TextStyle(
                        color: Color(0xFF003F44),
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: buttonColor,
                      size: 24,
                    ),
                  ],
                )
              ],
            ),
          ),
          // kedo
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: double.infinity,
              height: 173,
              decoration: const BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/kedo.jpeg',
                  ),
                ),
              ),
              // child: Container(
              //   color: Colors.red,
              //   child: const Row(
              //     children: [
              //       Column(
              //         children: [
              //           Text(
              //             'Avocadoes',
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 12,
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),
              //           Text('HGH'),
              //         ],
              //       )

              //       // Icom
              //     ],
              //   ),
              // ),
              child: Stack(
                alignment: const Alignment(1, 1),
                children: [
                  Positioned(
                    // alignment: Alignment(-10, 10),
                    // bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      width: double.infinity,
                      height: 52,
                      // color: Colors.red,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFF036E67).withOpacity(.86),
                            const Color(0xFF032D2B).withOpacity(.86),
                          ],
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Avocadoes',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Avocadoes',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),

                          //
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: const Color(0xFF04998F),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class EachCategoIcon extends StatelessWidget {
  final dynamic icon;
  final String text;

  const EachCategoIcon({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 75,
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.3),
            offset: const Offset(0, 5),
            blurRadius: 3,
          ),
        ],
        color: const Color(0xFFD9F0EE),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 25,
            color: buttonColor,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF017D87),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
