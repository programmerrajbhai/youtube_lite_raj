import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:youtube_lite_raj/Service/Server.dart';
import 'package:youtube_lite_raj/items.dart';
import 'package:http/http.dart' as http;

import '../Service/Api_Url.dart';


class Popular extends StatefulWidget {
  const Popular({super.key});

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  static List videoList = [];

  bool isLoading= false;

  Future<void> FatchYoutubeVideo() async {

    setState(() {
      isLoading = true; // লোডিং শুরু হলে true
    });

    final String apiUrl =
        'https://www.googleapis.com/youtube/v3/search?part=snippet&q=${Uri.encodeComponent("All tranding video")}&maxResults=50&regionCode=BD&relevanceLanguage=bn&key=${Api_Url.myApi}';

    var response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final request = jsonDecode(response.body);
      setState(() {
        videoList = request['items'];
        videoList.shuffle();
        isLoading= false;
      });
    } else {
      print('something want worng');
    }
  }

  @override
  void initState() {
    FatchYoutubeVideo();
    super.initState();
  }

  Future<void> _refreshData() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      videoList.shuffle();
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark
      ),
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refreshData,
                child: ListView.builder(
                  itemCount: videoList.length,
                  itemBuilder: (context, index) {

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
                        formattedViews: formattedViews,
                        videoId: videoId);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}