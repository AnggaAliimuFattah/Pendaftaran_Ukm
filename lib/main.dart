import 'package:flutter/material.dart';
import 'package:pendaftaran_ukm/view/Splash_screen.dart';
import 'package:pendaftaran_ukm/view/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pendaftaran UKM',
      //theme: ThemeData.dark(),
      home: SplashScreen(),
    );
  }
}