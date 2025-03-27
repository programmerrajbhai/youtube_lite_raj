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

  bool isLoading= false;

  Future<void> FatchYoutubeVideo() async {

    setState(() {
      isLoading = true; // লোডিং শুরু হলে true
    });
    String category = '25';
 /*   final String apiUrl =
        'https://www.googleapis.com/youtube/v3/videos?part=snippet,statistics&chart=mostPopular&videoCategoryId=$category&regionCode=US&maxResults=50&key=AIzaSyCbUcLeYWzSM-bBw7mmoYgMoYPvspjGDYI';
*/
    final String apiUrl =
        'https://www.googleapis.com/youtube/v3/search?part=snippet&q=বাংলা ইসলামিক&maxResults=10000&regionCode=BD&relevanceLanguage=bn&key=AIzaSyCbUcLeYWzSM-bBw7mmoYgMoYPvspjGDYI';

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
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: DefaultTabController(
          length: 4,
          child: Column(
            children: [

             TabBar(tabs: [
               Tab(text: 'home',),
               Tab(text: 'friend',),
               Tab(text: 'video',),
               Tab(text: 'notification',),
             ]),
              Expanded(
                child: TabBarView(children: [
                  Text('data',style: TextStyle(color: Colors.white),),
                  Text('sd'),
                  Text('as'),
                  Text('23'),
                ]),
              ),



              buildExpanded()


            ],
          ),
        ),
      ),
    );
  }

  Expanded buildExpanded() {
    return Expanded(
              child:isLoading? Center(
                child: CircularProgressIndicator(),
              ):  RefreshIndicator(
                onRefresh: _refreshData,
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
              ),



            );
  }
}
