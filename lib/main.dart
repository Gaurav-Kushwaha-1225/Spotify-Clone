import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify/constants.dart';

import 'artistsScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,//Palette.secondaryColor,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
      ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify',
      theme: ThemeData(primaryColor: Palette.primaryColor),
      debugShowCheckedModeBanner: false,
      home: const artistsScreen(title: "Artists Screen")//PlayingScreen(title: "PlayingScreen")//DashboardScreen(title: "DashboardScreen"), //PresplashScreen(title: 'Spotify - Presplash Screen'),
    );
  }
}

