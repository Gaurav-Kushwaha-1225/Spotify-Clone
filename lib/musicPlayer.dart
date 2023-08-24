// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class musicPlayer extends StatefulWidget {
  final String name;
  final String image;
  final String song;
  final String songName;
  const musicPlayer(
      {Key? key,
      required this.name,
      required this.image,
      required this.song,
      required this.songName})
      : super(key: key);

  @override
  State<musicPlayer> createState() => _musicPlayerState();
}

class _musicPlayerState extends State<musicPlayer> {
  Icon repeat = const Icon(Icons.repeat, color: Colors.white, size: 40);
  bool repeat_song = false;
  Icon shuffle = const Icon(
    Icons.shuffle_sharp,
    color: Colors.white,
    size: 40,
  );
  bool shuffle_song = false;

  double currentPlayTime = 0;

  bool isPlaying = false;
  late final AudioPlayer player;
  late final AssetSource path;

  Duration _duration = const Duration();
  Duration _position = const Duration();

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future initPlayer() async {
    player = AudioPlayer();
    path = AssetSource(widget.songName);

    player.onDurationChanged.listen((Duration d) {
      setState(() => _duration = d);
    });

    player.onPositionChanged.listen((Duration p) {
      setState(() => _position = p);
    });

    player.onPlayerComplete.listen((_) {
      setState(() => _position = _duration);
    });
  }

  void playPause() async {
    if (isPlaying) {
      player.pause();
      isPlaying = false;
    } else {
      player.play(path);
      isPlaying = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                Colors.deepPurple.shade800.withOpacity(0.8),
                Colors.black87.withOpacity(0.8)
              ],
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
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("PLAYING FROM ARTIST",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "SpotifyCircularBook",
                                fontWeight: FontWeight.w600,
                                fontSize: 12)),
                        Text(widget.name,
                            style: const TextStyle(
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
                      top: 30, left: 35, right: 35, bottom: 35),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(widget.image))),
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 35),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 70,
                  height: 25,
                  child: Marquee(
                    text: widget.song,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "SpotifyCircularBold",
                        fontSize: 20),
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    blankSpace: 300,
                    velocity: 30.0,
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
                    text: widget.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "SpotifyCircularBook",
                        fontWeight: FontWeight.w400,
                        fontSize: 17),
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    blankSpace: 300,
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
                          value: _position.inSeconds.toDouble(),
                          min: 0,
                          max: _duration.inSeconds.toDouble(),
                          divisions: 341,
                          onChanged: (value) async {
                            await player.seek(Duration(seconds: value.toInt()));
                            setState(() {});
                          },
                        ),
                      ))),
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        "${(_position.inMinutes % 60).toString().padLeft(2, '0')}:${(_position.inSeconds % 60).toString().padLeft(2, '0')}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "SpotifyCircularBook",
                            fontWeight: FontWeight.w600,
                            fontSize: 15)),
                    Text(
                        "${(_duration.inMinutes % 60).toString().padLeft(2, '0')}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "SpotifyCircularBook",
                            fontWeight: FontWeight.w600,
                            fontSize: 15))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          if (shuffle_song) {
                            shuffle = const Icon(Icons.shuffle_sharp,
                                color: Colors.white, size: 40);
                            shuffle_song = false;
                          } else {
                            shuffle = Icon(Icons.shuffle_on_sharp,
                                color: Colors.greenAccent.shade400, size: 40);
                            shuffle_song = true;
                          }
                        },
                        icon: shuffle),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.skip_previous_sharp,
                          color: Colors.white,
                          size: 40,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(right: 50, bottom: 50),
                      child: IconButton(
                          onPressed: playPause,
                          icon: Icon(
                            isPlaying
                                ? Icons.pause_circle_filled_sharp
                                : Icons.play_circle_fill_sharp,
                            color: Colors.white,
                            size: 90,
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
                        onPressed: () {
                          setState(() {
                            if (repeat_song) {
                              repeat = const Icon(Icons.repeat,
                                  color: Colors.white, size: 40);
                              repeat_song = false;
                            } else {
                              repeat = Icon(Icons.repeat_one_sharp,
                                  color: Colors.greenAccent.shade400, size: 40);
                              repeat_song = true;
                            }
                          });
                        },
                        icon: repeat)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: SizedBox(
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
                ),
              )
            ],
          )),
    );
  }
}
