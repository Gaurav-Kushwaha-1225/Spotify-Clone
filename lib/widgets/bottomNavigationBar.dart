// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class bottomNavigationWidget extends StatefulWidget {
  const bottomNavigationWidget({Key? key}): super(key: key);

  @override
  State<bottomNavigationWidget> createState() => _bottomNavigationWidgetState();
}

class _bottomNavigationWidgetState extends State<bottomNavigationWidget> {
  int currentIndex = 0;
  Color homeColor = Colors.white;
  Color searchColor = Colors.white54;
  Color libraryColor = Colors.white54;
  Color premiumColor = Colors.white54;
  double homeSize = 27;
  double homeTextSize = 15;
  double searchSize = 24;
  double searchTextSize = 13;
  double librarySize = 24;
  double libraryTextSize = 13;
  double premiumSize = 24;
  double premiumTextSize = 13;
  
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
        ),
        height: 70,
        child: Theme(
          data: Theme.of(context).copyWith(
              splashColor: Colors.white24, highlightColor: Colors.transparent),
          child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) => setState(() {
                    currentIndex = index;
                    if (currentIndex == 0) {
                      homeSize = 27;
                      searchSize = 24;
                      librarySize = 24;
                      premiumSize = 24;
                      libraryColor = Colors.white54;
                      premiumColor = Colors.white54;
                    }
                    if (currentIndex == 1) {
                      homeSize = 24;
                      searchSize = 27;
                      librarySize = 24;
                      premiumSize = 24;
                      libraryColor = Colors.white54;
                      premiumColor = Colors.white54;
                    }
                    if (currentIndex == 2) {
                      homeSize = 24;
                      searchSize = 24;
                      librarySize = 27;
                      premiumSize = 24;
                      libraryColor = Colors.white;
                      premiumColor = Colors.white54;
                    }
                    if (currentIndex == 3) {
                      homeSize = 24;
                      searchSize = 24;
                      librarySize = 24;
                      premiumSize = 27;
                      libraryColor = Colors.white54;
                      premiumColor = Colors.white;
                    }
                  }),
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white54,
              selectedFontSize: 15,
              unselectedFontSize: 13,
              //useLegacyColorScheme: false,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled, size: homeSize),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search, size: searchSize),
                    label: "Search"),
                BottomNavigationBarItem(
                    icon: Image.asset("assets/icons/library.png",
                        height: librarySize,
                        width: librarySize,
                        color: libraryColor),
                    label: "Your Library"),
                BottomNavigationBarItem(
                    icon: Image.asset("assets/icons/spotify.png",
                        height: premiumSize,
                        width: premiumSize,
                        color: premiumColor),
                    label: "Premium"),
              ]),
        ),
      );
  }
}
