// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'constants.dart';
import 'dashboardScreen.dart';

class PresplashScreen extends StatefulWidget {
  const PresplashScreen({super.key, required this.title});
  final String title;

  @override
  State<PresplashScreen> createState() => _PresplashScreenState();
}

class _PresplashScreenState extends State<PresplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const DashboardScreen(title: "DashboardScreen")));
  }
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
