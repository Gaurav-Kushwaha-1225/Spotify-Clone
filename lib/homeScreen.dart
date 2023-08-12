// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:spotify/widgets/dashboardScreenWidgets/artistAndPodcastersColumn.dart';
import 'package:spotify/widgets/dashboardScreenWidgets/recentPlaylistContainer.dart';
import 'package:spotify/widgets/dashboardScreenWidgets/recentlyPlayed.dart';

class homeScreen extends StatefulWidget {
  final List<Map<String, dynamic>> recentPlayedItems;
  final List<Map<String, dynamic>> recentPlaylistItems;
  final List<Map<String, dynamic>> artistAndPodcastersItems;
  const homeScreen({Key? key, required this.recentPlayedItems, required this.recentPlaylistItems, required this.artistAndPodcastersItems}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    itemCount: widget.recentPlaylistItems.length,
                    itemBuilder: (BuildContext context, index) {
                      return recentPlaylistContainer(
                          name: widget.recentPlaylistItems[index]["name"],
                          image: widget.recentPlaylistItems[index]["image"]);
                    },
                  ),
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
                padding:
                    EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 15),
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
                            name: widget.artistAndPodcastersItems[i]['name'],
                            image: widget.artistAndPodcastersItems[i]['image'],
                            border_radius: widget.artistAndPodcastersItems[i]
                                ['border_radius'],
                            artistAndPodcastersItems:
                                widget.artistAndPodcastersItems),
                    ],
                  ),
                )),
            const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: SizedBox(height: 70, width: double.infinity))
          ]),
    );
  }
}