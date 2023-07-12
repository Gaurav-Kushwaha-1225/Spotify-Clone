import 'package:flutter/material.dart';
import 'package:spotify/constants.dart';

class artistsScreen extends StatefulWidget {
  const artistsScreen({super.key, required this.title});
  final String title;

  @override
  State<artistsScreen> createState() => _artistsScreenState();
}

class _artistsScreenState extends State<artistsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.pinkAccent,
        Palette.secondaryColor,
        Palette.secondaryColor
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          body: SingleChildScrollView(
            primary: true,
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      child: Align(
                        alignment: Alignment.topCenter,
                        heightFactor: 0.63,
                        child: Image.asset("assets/images/arijit_singh.jpg",
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                        left: 20,
                        top: 45,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.black38,
                          child: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                size: 25,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                print(5);
                              }),
                        )),
                    const Positioned(
                      left: 20,
                      bottom: 0,
                      child: Text(
                        "Arijit Singh",
                        style: TextStyle(
                            fontSize: 51,
                            fontFamily: "SpotifyCircularMedium",
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  //height: 10,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 15),
                        child: Column(
                          children: [
                            const Text(
                              "36,598,945 monthly listeners",
                              style: TextStyle(
                                  color: Colors.white54,
                                  fontFamily: "SpotifyCircularBook",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        side: BorderSide(color: Colors.white)),
                                    onPressed: h,
                                    child: const Text("Following",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: "SpotifyCircularBook",
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 2))),
                                const IconButton(
                                    icon: Icon(
                                      Icons.more_vert_sharp,
                                      size: 28,
                                      color: Colors.white,
                                    ),
                                    onPressed: h)
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, right: 15),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: h,
                                icon: Icon(
                                  Icons.shuffle,
                                  size: 28,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

void h() {
  print(2);
}
