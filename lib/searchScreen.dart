// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:spotify/constants.dart';

class searchScreen extends StatefulWidget {
  
  const searchScreen({Key? key}) : super(key: key);

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  ScrollController scrollController = ScrollController();
  bool showSearchBar = false;

  @override
  void initState() {
    scrollController = ScrollController()
      ..addListener(() {
        //print(scrollController.position);
        if (scrollController.offset > 93) {
          showSearchBar = true;
        } else {
          showSearchBar = false;
        }
        setState(() {});
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(toolbarHeight: 0, backgroundColor: Palette.secondaryColor),
          backgroundColor: Palette.secondaryColor,
          body: Stack(
            children: [
              SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text("Search",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontFamily: "SpotifyCircularBold")),
                            IconButton(
                                onPressed: h,
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                icon: Icon(Icons.camera_alt_outlined,
                                    color: Colors.white))
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                SizedBox(width: 5),
                                Icon(Icons.search_sharp,
                                    color: Palette.secondaryColor, size: 30),
                                SizedBox(width: 4),
                                Text("What do you want to listen to?",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "SpotifyCircularMedium",
                                        color: Palette.secondarySwatchColor),
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Row(
                          children: const [
                            Text("Browse all",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "SpotifyCircularMedium",
                                    color: Colors.white),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      ),
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15,
                                childAspectRatio: 1.655),
                        primary: false,
                        shrinkWrap: true,
                        itemCount: 12,
                        itemBuilder: (BuildContext context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Row(
                              children: [
                                Container(
                                  width:
                                      (MediaQuery.of(context).size.width - 45) / 2,
                                  height: 105,
                                  decoration:
                                      BoxDecoration(color: Colors.red.shade600),
                                  child: Stack(
                                    children: [
                                      const Positioned(
                                        top: 12,
                                        left: 8,
                                        child: Text("Podcasts",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontFamily: "SpotifyCircularMedium",
                                                color: Colors.white)),
                                      ),
                                      Positioned(
                                          top: 15,
                                          left: 136,
                                          child: Transform(
                                              transform: Matrix4.rotationZ(
                                                (3.1415926535897932 / 7.2),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.asset(
                                                  "assets/images/dissect.jpg",
                                                  height: 78,
                                                  width: 78,
                                                ),
                                              )))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                child: InkWell(
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 0),
                    opacity: showSearchBar ? 1 : 0,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                      color: Palette.secondaryColor,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            SizedBox(width: 5),
                            Icon(Icons.search_sharp,
                                color: Palette.secondaryColor, size: 30),
                            SizedBox(width: 4),
                            Text("What do you want to listen to?",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "SpotifyCircularMedium",
                                    color: Palette.secondarySwatchColor),
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 70,
          left: 10,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.indigo.shade900,
                borderRadius: BorderRadius.circular(10)),
            width: MediaQuery.of(context).size.width - 20,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset("assets/songs/arijitSingh/images/tamasha.jpg"),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width - 46 - 194,
                          height: 20,
                          child: Marquee(
                            text: "Agar Tum Saath Ho (From Tamasha)",
                            style: const TextStyle(
                                fontSize: 15,
                                fontFamily: "SpotifyCircularBold",
                                color: Colors.white),
                            scrollAxis: Axis.horizontal,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            blankSpace: 70,
                            velocity: 20.0,
                            startPadding: 5.0,
                          )),
                      const Text(
                        "Arijit Singh",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "SpotifyCircularMedium",
                            color: Colors.white),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon:
                          const Icon(Icons.devices_sharp, color: Colors.grey)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_outlined,
                          color: Colors.greenAccent[400])),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow_rounded,
                          color: Colors.white))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

h() {}
