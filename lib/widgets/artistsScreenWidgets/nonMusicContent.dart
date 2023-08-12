// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';

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
