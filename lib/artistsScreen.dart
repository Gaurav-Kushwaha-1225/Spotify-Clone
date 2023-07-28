// ignore_for_file: camel_case_types, file_names
import 'package:flutter/material.dart';
import 'package:spotify/constants.dart';

class artistsScreen extends StatefulWidget {
  final String image;
  final String name;
  final List<Map<String, dynamic>> moreLikeThisItems;
  const artistsScreen({Key? key, required this.name, required this.image, required this.moreLikeThisItems})
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
                              Colors.pink.shade400,
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
                        : nonMusicContent(
                            data: widget.moreLikeThisItems),
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

class musicContent extends StatefulWidget {
  final String image;
  final String name;
  const musicContent({Key? key, required this.image, required this.name}) : super(key: key);

  @override
  State<musicContent> createState() => _musicContentState();
}

class _musicContentState extends State<musicContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${index + 1}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "SpotifyCircularBook",
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  Image.asset(Songs.songDetails[widget.name]![index]['image']!, height: 50, width: 50),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.54,
                          child: Text(Songs.songDetails[widget.name]![index]['name']!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: "SpotifyCircularBook",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17),
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ),
                        const Text(
                          "284,854,600",
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: "SpotifyCircularBook",
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        )
                      ]),
                  const IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        size: 25,
                        color: Colors.grey,
                      ),
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: h)
                ],
              );
            },
            itemCount: 5,
            primary: false,
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            itemExtent: 70),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: Text(
              "About",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "SpotifyCircularBold",
                  fontWeight: FontWeight.w300,
                  fontSize: 23),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
          child: Stack(
            children: [
              Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Align(
                          alignment: Alignment.center,
                          heightFactor: 0.954,
                          child: Image.network(
                            widget.image,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ))),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.883,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Colors.black87,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black54
                          ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter)),
                    ),
                  ),
                  const Positioned(
                      top: 20,
                      left: 20,
                      child: Icon(Icons.verified, color: Colors.blue)),
                  const Positioned(
                    top: 20,
                    left: 60,
                    child: Text("VERIFIED ARTIST",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "SpotifyCircularLight",
                            letterSpacing: 2,
                            wordSpacing: 2,
                            fontWeight: FontWeight.w500)),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 20,
                    child: RichText(
                        text: const TextSpan(
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "SpotifyCircularBook",
                                fontWeight: FontWeight.w800,
                                fontSize: 20),
                            children: [
                              TextSpan(text: "3,62,30,849"),
                              TextSpan(
                                  text: " MONTHLY LISTENERS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: "SpotifyCircularLight",
                                      letterSpacing: 1.5,
                                      wordSpacing: 1.5,
                                      fontWeight: FontWeight.w500))
                            ]),
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.fade),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class nonMusicContent extends StatefulWidget {
  final List<Map<String, dynamic>> data;
  const nonMusicContent({Key? key, required this.data})
      : super(key: key);

  @override
  State<nonMusicContent> createState() => _nonMusicContentState();
}

class _nonMusicContentState extends State<nonMusicContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0;
                  //i < (isLoaded ? recentPlayedItems.length : 6);
                  i < 8;
                  i++)
                (Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.network(widget.data[i]['image'],
                            height: 120, width: 120),
                      ),
                      Container(
                        width: 120,
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(widget.data[i]['name'],
                            style: const TextStyle(
                                fontSize: 15,
                                fontFamily: "SpotifyCircularBold",
                                color: Colors.white),
                            textAlign: TextAlign.left,
                            softWrap: false,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                )),
            ],
          ),
        ));
  }
}

void h() {}
