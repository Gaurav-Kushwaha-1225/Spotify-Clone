// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class musicPlayer extends StatefulWidget {
  const musicPlayer({Key? key}) : super(key: key);

  @override
  State<musicPlayer> createState() => _musicPlayerState();
}

class _musicPlayerState extends State<musicPlayer> {
  double currentPlayTime = 0;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.lightBlue, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.mirror)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text("PLAYING FROM ARTIST",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "SpotifyCircularBook",
                                fontWeight: FontWeight.w600,
                                fontSize: 12)),
                        Text("Arijit Singh",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "SpotifyCircularBook",
                                fontWeight: FontWeight.w600,
                                fontSize: 15)),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert_sharp,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 40, left: 35, right: 35, bottom: 35),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset("assets/images/trs.jpg"))),
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 35),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 70,
                  height: 25,
                  child: Marquee(
                    text: "Agar Tum Saath Ho (From Tamasha)",
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "SpotifyCircularBold",
                        fontSize: 20),
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    blankSpace: 120,
                    velocity: 40.0,
                    startPadding: 5.0,
                    pauseAfterRound: const Duration(seconds: 2),
                    startAfter: const Duration(seconds: 2),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 35, right: 35),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 70,
                  height: 25,
                  child: Marquee(
                    text: "Alka Yagnik, Arijit Singh",
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "SpotifyCircularBook",
                        fontWeight: FontWeight.w400,
                        fontSize: 17),
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    blankSpace: 150,
                    velocity: 30.0,
                    startPadding: 5.0,
                    pauseAfterRound: const Duration(seconds: 2),
                    startAfter: const Duration(seconds: 2),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: SliderTheme(
                      data: SliderThemeData(
                        activeTrackColor: Colors.white70,
                        thumbColor: Colors.white,
                        inactiveTrackColor: Colors.grey[850],
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 20,
                        child: Slider(
                          value: currentPlayTime,
                          min: 0,
                          max: 341,
                          divisions: 341,
                          onChanged: (value) {
                            setState((() => currentPlayTime = value));
                          },
                        ),
                      ))),
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${currentPlayTime~/60}:${currentPlayTime.toInt()%60}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "SpotifyCircularBook",
                            fontWeight: FontWeight.w600,
                            fontSize: 15)),
                    const Text("5:41",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "SpotifyCircularBook",
                            fontWeight: FontWeight.w600,
                            fontSize: 15))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.shuffle_sharp,
                          color: Colors.white,
                          size: 40,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.skip_previous_sharp,
                          color: Colors.white,
                          size: 40,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(right: 60, bottom: 60),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.play_circle_fill_sharp,
                            color: Colors.white,
                            size: 100,
                          )),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.skip_next_sharp,
                          color: Colors.white,
                          size: 40,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.repeat_sharp,
                          color: Colors.white,
                          size: 40,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 40,
                child: Stack(
                  children: [
                    Positioned(
                        left: 20,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.devices,
                              color: Colors.white,
                              size: 30,
                            ))),
                    Positioned(
                        right: 10,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.horizontal_split_sharp,
                              color: Colors.white,
                              size: 30,
                            ))),
                    Positioned(
                        right: 75,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.share_sharp,
                              color: Colors.white,
                              size: 30,
                            ))),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
