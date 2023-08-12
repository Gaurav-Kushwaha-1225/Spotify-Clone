//import 'dart:js_util';
// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:spotify/constants.dart';
import 'package:spotify/searchScreen.dart';
import 'package:spotify/homeScreen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.title});
  final String title;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool home = true;

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

  // Internet Connection Checker :---
  late ConnectivityResult result;
  late StreamSubscription subscription;
  var isDeviceConnected = false;

  @override
  void initState() {
    super.initState();
    checkInternet();
    startStreaming();
  }

  checkInternet() async {
    result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      isDeviceConnected = true;
      _loadData();
    } else {
      isDeviceConnected = false;
      showDialogBox();
    }
    setState(() {});
  }

  startStreaming() {
    subscription = Connectivity().onConnectivityChanged.listen((event) async {
      checkInternet();
    });
  }
  // :---

  // recent Playlist Data :---
  var recentPlaylistData =
      FirebaseFirestore.instance.collection("recentPlaylistData");
  late List<Map<String, dynamic>> recentPlaylistItems;

  var recentPlayedData =
      FirebaseFirestore.instance.collection("recentlyPlayed");
  late List<Map<String, dynamic>> recentPlayedItems;

  var artistAndPodcasters =
      FirebaseFirestore.instance.collection("artistsAndPodcasters");
  late List<Map<String, dynamic>> artistAndPodcastersItems;

  bool isLoaded = false;

  _loadData() async {
    List<Map<String, dynamic>> recentPlaylistTempList = [];
    var data_recentPlaylist = await recentPlaylistData.get();

    List<Map<String, dynamic>> recentPlayedTempList = [];
    var data_recentPlayed = await recentPlayedData.get();

    List<Map<String, dynamic>> artistAndPodcastersTempList = [];
    var data_artistAndPodcasters = await artistAndPodcasters.get();

    for (var element in data_recentPlaylist.docs) {
      recentPlaylistTempList.add(element.data());
    }

    for (var element in data_recentPlayed.docs) {
      recentPlayedTempList.add(element.data());
    }

    for (var element in data_artistAndPodcasters.docs) {
      artistAndPodcastersTempList.add(element.data());
    }

    setState(() {
      recentPlaylistItems = recentPlaylistTempList;
      recentPlayedItems = recentPlayedTempList;
      artistAndPodcastersItems = artistAndPodcastersTempList;
      isLoaded = true;
    });
  }
  // :---

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Palette.secondaryColor,
        ),
        backgroundColor: Palette.secondaryColor,
        body: isLoaded
            ? (home
                ? homeScreen(
                    recentPlayedItems: recentPlayedItems,
                    recentPlaylistItems: recentPlaylistItems,
                    artistAndPodcastersItems: artistAndPodcastersItems)
                : const searchScreen())
            : Container(),
        extendBody: true,
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
          ),
          height: 70,
          child: Theme(
            data: Theme.of(context).copyWith(
                splashColor: Colors.white24,
                highlightColor: Colors.transparent),
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
                        home = true;
                      }
                      if (currentIndex == 1) {
                        homeSize = 24;
                        searchSize = 27;
                        librarySize = 24;
                        premiumSize = 24;
                        libraryColor = Colors.white54;
                        premiumColor = Colors.white54;
                        home = false;
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
        ));
  }

  // Internet error Dialog Box
  showDialogBox() {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text(
                "No internet connection",
                style: TextStyle(
                    fontFamily: "SpotifyCircularBold", color: Colors.white),
              ),
              content: const Text(
                "Turn on mobile data or connect to Wi-Fi.",
                style: TextStyle(
                    fontFamily: "SpotifyCircularLight",
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              backgroundColor: Palette.secondarySwatchColor,
              actionsAlignment: MainAxisAlignment.center,
              surfaceTintColor: Colors.red,
              actions: <Widget>[
                ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      checkInternet();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Palette.primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 10,
                        textStyle: const TextStyle(
                            fontFamily: "SpotifyCircularBold",
                            color: Colors.white,
                            fontSize: 18),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        fixedSize: const Size(250, 50)),
                    child: const Text("Try Again"))
              ],
            ));
  }
  // :---
}
