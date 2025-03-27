import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "package:intl/intl.dart";
import 'package:youtube_lite_raj/Server.dart';

import 'items.dart';

void main() {
  runApp(YoutubeLite());
}

class YoutubeLite extends StatefulWidget {
  const YoutubeLite({super.key});

  @override
  State<YoutubeLite> createState() => _YoutubeLiteState();
}

class _YoutubeLiteState extends State<YoutubeLite> {
  static List videoList = [];

  Future<void> FatchYoutubeVideo() async {
    String category = '10';
    final String apiUrl =
        'https://www.googleapis.com/youtube/v3/videos?part=snippet,statistics&chart=mostPopular&videoCategoryId=$category&regionCode=US&maxResults=50&key=AIzaSyCbUcLeYWzSM-bBw7mmoYgMoYPvspjGDYI';

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final request = jsonDecode(response.body);

      setState(() {});
      videoList = request['items'];
      print(response.body);
      print('ok');
    } else {
      print('something want worng');
    }
    // print(response.body);

    // print(videoList.length);
  }

  @override
  void initState() {
    FatchYoutubeVideo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: videoList.length,
                  itemBuilder: (contex, index) {
                    final video = videoList[index];
                    final title = video['snippet']['title'];

                    final views = video['statistics']?['viewCount'] ?? "0";
                    final intViews = int.tryParse(views) ?? 0;
                    final formattedViews =
                        NumberFormat.compact().format(intViews);

                    print(formattedViews);

                    final channelTitle = video['snippet']['channelTitle'];

                    final thumbnailUrl =
                        video['snippet']['thumbnails']['high']['url'];
                    final videoId = video['id'] is Map
                        ? video['id']['videoId']
                        : video['id'];

                    return Items(
                        thumbnailUrl: thumbnailUrl,
                        title: title,
                        channelTitle: channelTitle,
                        videoId: videoId,
                        formattedViews: formattedViews);
                  }),



            )
          ],
        ),
      ),
    );
  }
}
