import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:plant_scan/auth/firebase_options.dart';
import 'screens/SplashScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);
  runApp(
      const MyApp()); // Now isntall the firebase? I hope that it doenst break
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
