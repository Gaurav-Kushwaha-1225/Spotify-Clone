// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import '../../artistsScreen.dart';
import '../../constants.dart';

class recentPlaylistContainer extends StatelessWidget{
  final String image;
  final String name;
  final List<Map<String, dynamic>> artistAndPodcastersItems;
  const recentPlaylistContainer({Key? key, required this.name, required this.image, required this.artistAndPodcastersItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => artistsScreen(name: name, image: image, moreLikeThisItems: artistAndPodcastersItems)));
      },
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: Palette.secondarySwatchColor,
            borderRadius: BorderRadius.circular(5)),
        //height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(image)),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(name,
                  style: const TextStyle(
                      fontSize: 14,
                      fontFamily: "SpotifyCircularBold",
                      color: Colors.white),
                  softWrap: false,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
            )),
            const SizedBox(width: 10)
          ],
        ),
      ),
    );
  }
}