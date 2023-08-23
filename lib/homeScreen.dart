// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:spotify/widgets/dashboardScreenWidgets/artistAndPodcastersColumn.dart';
import 'package:spotify/widgets/dashboardScreenWidgets/recentPlaylistContainer.dart';
import 'package:spotify/widgets/dashboardScreenWidgets/recentlyPlayed.dart';

class homeScreen extends StatefulWidget {
  final List<Map<String, dynamic>> recentPlayedItems;
  final List<Map<String, dynamic>> recentPlaylistItems;
  final List<Map<String, dynamic>> artistAndPodcastersItems;
  const homeScreen(
      {Key? key,
      required this.recentPlayedItems,
      required this.recentPlaylistItems,
      required this.artistAndPodcastersItems})
      : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          //physics: ScrollPhysics(),
          primary: true,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // TODO: Put all left and right paddings in this outer column
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
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 3.125),

                  //physics: NeverScrollableScrollPhysics(),
                  primary: false,
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  //controller: ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  itemCount: widget.recentPlaylistItems.length,
                  itemBuilder: (BuildContext context, index) {
                    return recentPlaylistContainer(
                        name: widget.recentPlaylistItems[index]["name"],
                        image: widget.recentPlaylistItems[index]["image"],
                        artistAndPodcastersItems: widget.artistAndPodcastersItems);
                  },
                ),
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
                              i < widget.recentPlayedItems.length;
                              i++)
                            recentlyPlayed(
                                name: widget.recentPlayedItems[i]['name'],
                                image: widget.recentPlayedItems[i]['image'],
                                border_radius: widget.recentPlayedItems[i]
                                    ['border_radius'],
                                artistAndPodcastersItems:
                                    widget.artistAndPodcastersItems),
                        ],
                      ),
                    )),
                const Padding(
                    padding: EdgeInsets.only(
                        top: 15, left: 15, right: 15, bottom: 15),
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
                              i < widget.artistAndPodcastersItems.length;
                              i++)
                            artistAndPodcastersColumn(
                                name: widget.artistAndPodcastersItems[i]
                                    ['name'],
                                image: widget.artistAndPodcastersItems[i]
                                    ['image'],
                                border_radius:
                                    widget.artistAndPodcastersItems[i]
                                        ['border_radius'],
                                artistAndPodcastersItems:
                                    widget.artistAndPodcastersItems),
                        ],
                      ),
                    )),
                const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: SizedBox(height: 140, width: double.infinity))
              ]),
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
