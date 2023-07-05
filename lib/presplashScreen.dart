// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'constants.dart';

class PresplashScreen extends StatefulWidget {
  const PresplashScreen({super.key, required this.title});
  final String title;

  @override
  State<PresplashScreen> createState() => _PresplashScreenState();
}

class _PresplashScreenState extends State<PresplashScreen> {
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Palette.secondaryColor,
      body: Center(
        child: Image.asset("assets/images/spotify_logo.png", width: screenWidth/2, height: screenHeight/2)
      ),
    );
  }
}
