// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:plant_scan/constants/const.dart';

class PlantDitailsScreen extends StatelessWidget {
  const PlantDitailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: const Alignment(1, 1),
        children: [
          ListView(
            children: [
              // haader
              Container(
                width: double.infinity,
                height: 350,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/papaver-somniferum-cherry-glow.webp',
                    ),
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: SafeArea(
                  child: Stack(
                    children: [
                      Positioned(
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 29,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // info

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // title
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Text(
                        'Papaver Somniferum',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: const Color(0xFF104B50),
                          shadows: [
                            Shadow(
                              color: Colors.grey.withOpacity(.7),
                              offset: const Offset(0, 2.5),
                              blurRadius: 8,
                            )
                          ],
                        ),
                      ),
                    ),
                    // tabs
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TabModule(
                          text: 'Indoor',
                        ),
                        TabModule(
                          text: 'Pet friendly',
                        ),
                        TabModule(
                          text: 'Papaveraceae',
                        ),
                      ],
                    ),
                    // decripthin
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Description',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: buttonColor,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
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
                                  'Chat with Agent',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 11,
                                    color: buttonColor,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 8),
                                  child: const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 11,
                                    color: buttonColor,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Text(
                      'From Wikipedia, the free encyclopedia',
                      style: TextStyle(
                        color: Color(0xFFA8AEAD),
                        fontSize: 15,
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.2),
                            offset: const Offset(0, 5),
                            blurRadius: 8,
                          )
                        ],
                      ),
                      child: const Text(
                        'Papaver somniferum, commonly known as the opium poppy or breadseed poppy, is a species of flowering plant in the family Papaveraceae. It is the species of plant from which both opium and poppy seeds are dererived a... Read more',
                      ),
                    ),

                    // categotions

                    // const CategoryModal(
                    //   bgColor: Color(0xFFEEF7E8),
                    //   textColorCateg: Color(0xFF4B8364),
                    //   textHeader: 'Height',
                    //   textInfo: 'Small',
                    //   icon: Icons.straighten_rounded,
                    // ),

                    Container(
                      margin: EdgeInsets.only(bottom: 100),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CategoryModal(
                                bgColor: Color(0xFFEEF7E8),
                                textColorCateg: Color(0xFF4B8364),
                                textHeader: 'Height',
                                textInfo: 'Small',
                                icon: Icons.straighten_rounded,
                              ),
                              CategoryModal(
                                bgColor: Color(0xFFFCF1E3),
                                textColorCateg: Color(0xFFE6B44C),
                                textHeader: 'Light',
                                textInfo: 'Normal',
                                icon: Icons.wb_sunny_outlined,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CategoryModal(
                                bgColor: Color(0xFFE6EAFA),
                                textColorCateg: Color(0xFF5676DC),
                                textHeader: 'Water',
                                textInfo: '333ml',
                                icon: Icons.straighten_rounded,
                              ),
                              CategoryModal(
                                bgColor: Color(0xFFF8E8F8),
                                textColorCateg: Color(0xFFA559D9),
                                textHeader: 'Humidity',
                                textInfo: '56%',
                                icon: Icons.thermostat,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            margin: const EdgeInsets.all(20),
            width: double.infinity,
            // height: 100,
            decoration: BoxDecoration(
                color: Color(0xFF104B50),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.save_outlined,
                  size: 18,
                  color: Colors.white,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: const Text(
                    'Save this plant',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CategoryModal extends StatelessWidget {
  final Color bgColor;
  final Color textColorCateg;
  final String textHeader;
  final String textInfo;
  final dynamic icon;

  const CategoryModal({
    super.key,
    required this.bgColor,
    required this.textColorCateg,
    required this.textHeader,
    required this.textInfo,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          // icon
          Container(
            padding: const EdgeInsets.all(25.6 / 2),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: textColorCateg,
              size: 25.6,
            ),
          ),
          // texts
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textHeader,
                  style: TextStyle(
                    color: textColorCateg,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text(
                  textInfo,
                  style: const TextStyle(
                    color: Color(0xFF333333),
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TabModule extends StatelessWidget {
  final String text;
  const TabModule({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13.4, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFEAEFEE),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(text),
    );
  }
}
