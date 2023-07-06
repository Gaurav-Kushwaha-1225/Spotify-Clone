//import 'dart:js_util';

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:spotify/constants.dart';
import 'package:image_picker/image_picker.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.title});
  final String title;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
  bool isLoaded = false;

  _loadData() async {
    List<Map<String, dynamic>> recentPlaylistTempList = [];
    var data_recentPlaylist = await recentPlaylistData.get();

    data_recentPlaylist.docs.forEach((element) {
      recentPlaylistTempList.add(element.data());
    });

    setState(() {
      recentPlaylistItems = recentPlaylistTempList;
      isLoaded = true;
    });
  }

  Widget recentPlaylistContainer(name, image) {
    return Container(
      decoration: BoxDecoration(
          color: Palette.secondarySwatchColor,
          borderRadius: BorderRadius.circular(5)),
      //height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(image)),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(name,
                style: const TextStyle(
                    fontSize: 14,
                    fontFamily: "SpotifyCircularBold",
                    color: Colors.white),
                softWrap: false,
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
          ))
        ],
      ),
    );
  }
  // :---

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.secondaryColor,
      body: SingleChildScrollView(
        //physics: ScrollPhysics(),
        primary: true,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text("Good morning",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white,
                              fontFamily: "SpotifyCircularBold")),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.notifications_none_sharp,
                                color: Colors.white)),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.access_time_sharp,
                                color: Colors.white)),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.settings_outlined,
                                color: Colors.white))
                      ]),
                    )
                  ],
                ),
              ),
              isLoaded
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 3.125),

                      //physics: NeverScrollableScrollPhysics(),
                      primary: false,
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      //controller: ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      itemCount: recentPlaylistItems.length,
                      itemBuilder: (BuildContext context, index) {
                        return recentPlaylistContainer(
                            recentPlaylistItems[index]["name"],
                            recentPlaylistItems[index]["image"]);
                      },
                    )
                  : Container(),
              const Padding(
                  padding:
                      EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 15),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text("Recently played",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white,
                            fontFamily: "SpotifyCircularBold"),
                        textAlign: TextAlign.left),
                  )),
              Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset("assets/images/arijit_singh.jpg",
                                height: 120, width: 120),
                          ),
                          Container(
                            width: 120,
                            padding: EdgeInsets.only(top: 10),
                            child: Text("This is Arijit Singh",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "SpotifyCircularBold",
                                    color: Colors.white),
                                    textAlign: TextAlign.left),
                          )
                        ],
                      )
                    ],
                  ))
            ]),
      ),
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
      ),
    );
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
