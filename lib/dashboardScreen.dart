//import 'dart:js_util';
// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:spotify/artistsScreen.dart';
import 'package:spotify/constants.dart';
import 'package:spotify/widgets/artistAndPodcastersColumn.dart';
import 'package:spotify/widgets/bottomNavigationBar.dart';
import 'package:spotify/widgets/recentPlaylistContainer.dart';
import 'package:spotify/widgets/recentlyPlayed.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.title});
  final String title;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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

    data_recentPlaylist.docs.forEach((element) {
      recentPlaylistTempList.add(element.data());
    });

    data_recentPlayed.docs.forEach((element) {
      recentPlayedTempList.add(element.data());
    });

    data_artistAndPodcasters.docs.forEach((element) {
      artistAndPodcastersTempList.add(element.data());
    });

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
        body: SingleChildScrollView(
          //physics: ScrollPhysics(),
          primary: true,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35),
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
                              name: recentPlaylistItems[index]["name"],
                              image: recentPlaylistItems[index]["image"]);
                        },
                      )
                    : Container(),
                const Padding(
                    padding: EdgeInsets.only(
                        top: 30, left: 15, right: 15, bottom: 15),
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
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = 0;
                              i < (isLoaded ? recentPlayedItems.length : 6);
                              i++)
                            (isLoaded
                                ? (recentlyPlayed(
                                    name: recentPlayedItems[i]['name'],
                                    image: recentPlayedItems[i]['image'],
                                    border_radius: recentPlayedItems[i]
                                        ['border_radius'],
                                    artistAndPodcastersItems:
                                        artistAndPodcastersItems))
                                : Container()),
                        ],
                      ),
                    )),
                const Padding(
                    padding: EdgeInsets.only(
                        top: 30, left: 15, right: 15, bottom: 15),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Artists and Podcasters",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white,
                            fontFamily: "SpotifyCircularBold"),
                        textAlign: TextAlign.left,
                        maxLines: 2,
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = 0;
                              i <
                                  (isLoaded
                                      ? artistAndPodcastersItems.length
                                      : 6);
                              i++)
                            (isLoaded
                                ? (artistAndPodcastersColumn(
                                    name: artistAndPodcastersItems[i]['name'],
                                    image: artistAndPodcastersItems[i]['image'],
                                    border_radius: artistAndPodcastersItems[i]
                                        ['border_radius'],
                                    artistAndPodcastersItems:
                                        artistAndPodcastersItems))
                                : Container()),
                        ],
                      ),
                    )),
                const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: SizedBox(height: 70, width: double.infinity))
              ]),
        ),
        extendBody: true,
        bottomNavigationBar: const bottomNavigationWidget());
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
