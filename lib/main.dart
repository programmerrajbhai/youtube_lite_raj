import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "package:intl/intl.dart";


void main() {
  runApp(YoutubeLite());
}

class YoutubeLite extends StatefulWidget {
  const YoutubeLite({super.key});

  @override
  State<YoutubeLite> createState() => _YoutubeLiteState();
}

class _YoutubeLiteState extends State<YoutubeLite> {
  List videoList = [];

  Future<void> FatchYoutubeVideo() async {
    String category = '10';
    final String apiUrl =
        'https://www.googleapis.com/youtube/v3/videos?part=snippet,statistics&chart=mostPopular&videoCategoryId=$category&regionCode=US&maxResults=50&key=AIzaSyCbUcLeYWzSM-bBw7mmoYgMoYPvspjGDYI';

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final request = jsonDecode(response.body);
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
    // TODO: implement initState
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

// ✅ "K", "M", "B" ফরম্যাটে দেখানোর জন্য
                    final formattedViews = NumberFormat.compact().format(intViews);

                   print(formattedViews);

                    final channelTitle = video['snippet']['channelTitle'];

                    final thumbnailUrl =
                        video['snippet']['thumbnails']['high']['url'];
                    final videoId = video['id'] is Map
                        ? video['id']['videoId']
                        : video['id'];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.network(
                            thumbnailUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(),
                            SizedBox(width: 13,),
                            Expanded(

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),

                                  Row(

                                    children: [
                                      Text(channelTitle,style: TextStyle(fontSize: 12),),
                                      SizedBox(width: 10,),
                                      Text("$formattedViews"),
                                      SizedBox(width: 10,),
                                      Text('3 days ago',style: TextStyle(fontSize: 12),),
                                    ],
                                  )

                                ],
                              ),
                            ),


                          ],
                        )
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
