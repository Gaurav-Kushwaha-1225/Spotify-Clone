// ignore_for_file: camel_case_types, file_names
import 'package:flutter/material.dart';
import 'package:spotify/constants.dart';
import 'package:spotify/widgets/artistsScreenWidgets/musicContent.dart';
import 'package:spotify/widgets/artistsScreenWidgets/nonMusicContent.dart';

class artistsScreen extends StatefulWidget {
  final String image;
  final String name;
  final List<Map<String, dynamic>> moreLikeThisItems;
  const artistsScreen(
      {Key? key,
      required this.name,
      required this.image,
      required this.moreLikeThisItems})
      : super(key: key);

  @override
  State<artistsScreen> createState() => _artistsScreenState();
}

class _artistsScreenState extends State<artistsScreen> {
  ScrollController scrollController = ScrollController();
  bool music = true;
  bool showTopBar = false;
  bool showMoreContent = false;

  @override
  void initState() {
    scrollController = ScrollController()
      ..addListener(() {
        //print(scrollController?.position);
        if (scrollController.offset > 190) {
          showTopBar = true;
        } else {
          showTopBar = false;
        }
        setState(() {});
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Palette.secondaryColor),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          body: Stack(
            children: [
              SingleChildScrollView(
                //primary: true,
                physics: const ClampingScrollPhysics(),
                controller: scrollController,
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                              Colors.pinkAccent.shade100,
                              Palette.secondaryColor
                            ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                        child: Column(children: [
                          Stack(
                            children: [
                              ClipRRect(
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  heightFactor: 0.75,
                                  child: Image.network(widget.image,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.width * 0.753,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                      Colors.black87,
                                      Colors.transparent,
                                      Colors.transparent,
                                    ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter)),
                              ),
                              Positioned(
                                left: 20,
                                bottom: 0,
                                child: Text(
                                  widget.name,
                                  style: const TextStyle(
                                      fontSize: 43,
                                      fontFamily: "SpotifyCircularBold",
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      height: 2,
                                      overflow: TextOverflow.ellipsis),
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15, left: 15, right: 15),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          OutlinedButton(
                                              style: ButtonStyle(
                                                  overlayColor:
                                                      MaterialStatePropertyAll(
                                                          Colors.transparent),
                                                  side:
                                                      MaterialStatePropertyAll(
                                                          BorderSide(
                                                              color: Colors
                                                                  .white))),
                                              onPressed: h,
                                              child: Text("Following",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontFamily:
                                                          "SpotifyCircularBook",
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: 2))),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          IconButton(
                                              icon: Icon(
                                                Icons.more_vert_sharp,
                                                size: 30,
                                                color: Colors.grey,
                                              ),
                                              highlightColor:
                                                  Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onPressed: h)
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      IconButton(
                                          onPressed: h,
                                          icon: Icon(
                                            Icons.shuffle,
                                            size: 28,
                                            color: Colors.grey,
                                          ),
                                          highlightColor: Colors.transparent,
                                          splashColor: Colors.transparent),
                                      CircleAvatar(
                                        radius: 24,
                                        backgroundColor: Palette.primaryColor,
                                        child: IconButton(
                                            onPressed: h,
                                            icon: Icon(
                                              Icons.play_arrow_rounded,
                                              size: 32,
                                              color: Colors.black,
                                            ),
                                            highlightColor: Colors.transparent,
                                            splashColor: Colors.transparent),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ])),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 15),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 3,
                                        color: music
                                            ? Palette.primaryColor
                                            : Colors.transparent))),
                            child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    music = true;
                                  });
                                },
                                style: const ButtonStyle(
                                    overlayColor: MaterialStatePropertyAll(
                                        Colors.transparent)),
                                child: const Text("Music",
                                    style: TextStyle(
                                        color: Colors.white54,
                                        fontFamily: "SpotifyCircularBook",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16))),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 3,
                                        color: music
                                            ? Colors.transparent
                                            : Palette.primaryColor))),
                            child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    music = false;
                                  });
                                },
                                style: const ButtonStyle(
                                    overlayColor: MaterialStatePropertyAll(
                                        Colors.transparent)),
                                child: const Text("More Like This",
                                    style: TextStyle(
                                        color: Colors.white54,
                                        fontFamily: "SpotifyCircularBook",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17))),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    // ignore: prefer_const_constructors
                    music
                        ? musicContent(image: widget.image, name: widget.name)
                        : nonMusicContent(data: widget.moreLikeThisItems),
                  ],
                ),
              ),
              Positioned(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: showTopBar
                              ? [
                                  Palette.secondarySwatchColor,
                                  Colors.pink.shade700,
                                ]
                              : [Colors.transparent, Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          tileMode: TileMode.decal)),
                  child: SafeArea(
                    child: SizedBox(
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: 14,
                            left: 75,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 1000),
                              opacity: showTopBar ? 1 : 0,
                              child: Text(widget.name,
                                  style: TextStyle(
                                      color: showTopBar
                                          ? Colors.white
                                          : Colors.transparent,
                                      fontFamily: "SpotifyCircularBook",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17),
                                  textAlign: TextAlign.left),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  left: 10,
                  top: 34,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: showTopBar
                        ? Colors.black38.withOpacity(0)
                        : Colors.black38,
                    child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 25,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent),
                  )),
            ],
          )),
    );
  }
}
