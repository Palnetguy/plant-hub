import 'package:plant_scan/constants/const.dart';
import 'package:plant_scan/screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // // Introduce a delay to simulate a splash screen
    // Future.delayed(const Duration(seconds: 5), () {
    //   // After the delay, navigate to the main screen of your app
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(
    //       builder: (context) => const WelcomeScreen(),
    //     ),
    //   );
    // });

    return Scaffold(
      body: SizedBox(
        // padding: EdgeInsets.only(top: 100),
        width: double.infinity,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [color1, color2],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 200, bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: <Widget>[
                      Container(
                        width: 290,
                        height: 290,
                        decoration: const BoxDecoration(
                          // color: Colors.red,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                      ),
                      const Text(
                        'Plant Scan',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 32,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                  const Loader()
                      .animate(
                        autoPlay: true,
                        onPlay: (controller) => controller.repeat(),
                      )
                      .rotate(
                        duration: const Duration(seconds: 2),
                      )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(5),
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: textColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: color3,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(5),
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: color3,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: textColor,
              ),
            )
          ],
        ),
      ],
    );
  }
}
