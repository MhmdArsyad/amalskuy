import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:amalskuy/constants.dart';
import 'package:amalskuy/screens/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amalskuy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "DMSans",
        colorScheme: ColorScheme.fromSeed(seedColor: kprimaryColor),
        scaffoldBackgroundColor: kbackgroundColor,
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}
