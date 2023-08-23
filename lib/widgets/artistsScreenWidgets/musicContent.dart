// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:spotify/musicPlayer.dart';

import '../../constants.dart';

class musicContent extends StatefulWidget {
  final String image;
  final String name;
  const musicContent({Key? key, required this.image, required this.name})
      : super(key: key);

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
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => musicPlayer(
                              name: widget.name,
                              image: Songs.songDetails[widget.name]![index]
                                  ['image']!,
                                  song: Songs.songDetails[widget.name]![index]['name']!,
                                  songName: Songs.songDetails[widget.name]![index]['song']!)));
                },
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Row(
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
                    Image.asset(
                        Songs.songDetails[widget.name]![index]['image']!,
                        height: 50,
                        width: 50),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.54,
                            child: Text(
                                Songs.songDetails[widget.name]![index]['name']!,
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
                ),
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

void h() {}
