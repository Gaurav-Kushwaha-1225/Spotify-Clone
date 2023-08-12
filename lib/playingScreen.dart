// ignore_for_file: file_names

import 'package:flutter/material.dart';

class PlayingScreen extends StatefulWidget {
  const PlayingScreen({super.key, required this.title});
  final String title;

  @override
  State<PlayingScreen> createState() => _PlayingScreenState();
}

class _PlayingScreenState extends State<PlayingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
              colors: [Colors.red, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent
      )
    );
  }

}