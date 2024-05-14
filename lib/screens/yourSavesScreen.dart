import 'package:plant_scan/screens/plantDetailsScreen.dart';
import 'package:flutter/material.dart';

import 'package:plant_scan/constants/const.dart';
import 'package:plant_scan/widgets/midx_appbar.dart';

class YourSaves extends StatelessWidget {
  final VoidCallback? goBack;
  const YourSaves({
    super.key,
    this.goBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MidxAppbar(
            title: 'Your Saves',
            goBack: goBack,
          ),

          // saved
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1 / 1.15,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                // mainAxisSpacing: 0,
              ),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return const SaveModule();
              },
            ),
          ),
          // SaveModule(),
        ],
      ),
    );
  }
}

class SaveModule extends StatelessWidget {
  const SaveModule({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PlantDitailsScreen(),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Container(
            // width: 150,
            decoration: BoxDecoration(
              border: Border.all(color: buttonColor, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Stack(
                  alignment: const Alignment(1, -1),
                  children: [
                    //  image
                    Container(
                      height: 156,
                      // width: 150,
                      // color: Colors.black,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/mangoes.jpg'),
                        ),
                      ),
                    ),
                    // close icon
                    Container(
                      padding: const EdgeInsets.all(1),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 15,
                      ),
                    ),
                  ],
                ),
                // info
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Mango',
                        style: TextStyle(
                          color: Color(0xFF104B50),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.4),
                                offset: const Offset(0, 3),
                                blurRadius: 5,
                              )
                            ]),
                        child: const Icon(
                          // padding: EdgeInsets.all(0),
                          Icons.favorite,
                          color: buttonColor,
                          size: 15,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
