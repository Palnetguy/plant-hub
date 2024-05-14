import 'package:plant_scan/constants/const.dart';
import 'package:plant_scan/screens/plantDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchFunctionScreen extends StatelessWidget {
  const SearchFunctionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // header
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: buttonColor,
                      size: 29,
                    ),
                  ),
                  const SearchArea(),
                  // sort by
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        const Line(),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: const Row(
                            children: [
                              Text(
                                'Sort by : ',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF04998F),
                                ),
                              ),

                              // sort Options
                              Row(
                                children: [
                                  EachSortOption(),
                                  EachSortOption(),
                                ],
                              )
                            ],
                          ),
                        ),
                        const Line(),
                      ],
                    ),
                  )
                ],
              ),
              // searched

              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                    ),
                    itemCount: 30,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return const EachPlant();
                    },
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

// each plant
class EachPlant extends StatelessWidget {
  const EachPlant({
    super.key,
  });

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
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          alignment: const Alignment(1, 1),
          children: [
            Container(
              height: 183,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/papaver-somniferum-cherry-glow.webp',
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF036E67).withOpacity(.86),
                    const Color(0xFF032D2B).withOpacity(.86),
                  ],
                ),
              ),
              // height: 50,
              child: const Text(
                'Papaver Somniferum',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// each sort
class EachSortOption extends StatelessWidget {
  const EachSortOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.4),
            offset: const Offset(0, 5),
            blurRadius: 8,
          )
        ],
      ),
      child: Row(
        children: [
          const Text(
            'Size',
            style: TextStyle(
              color: Color(0xFF04998F),
              fontSize: 8,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 5),
            child: const Text(
              'X',
              style: TextStyle(
                color: Color(0xFF04998F),
                fontSize: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// line
class Line extends StatelessWidget {
  const Line({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: buttonColor,
    );
  }
}

// search Are at the top

class SearchArea extends StatelessWidget {
  const SearchArea({
    super.key,
  });

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
        Container(
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
        )
      ],
    );
  }
}
