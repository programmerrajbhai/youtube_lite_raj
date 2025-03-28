import 'package:flutter/material.dart';
import 'package:youtube_lite_raj/AllTab/Islamic.dart';
import 'package:youtube_lite_raj/AllTab/Motivation.dart';
import 'package:youtube_lite_raj/AllTab/News.dart';
import 'package:youtube_lite_raj/AllTab/Song&Movie.dart';
import 'package:youtube_lite_raj/AllTab/Sport.dart';
import 'package:youtube_lite_raj/AllTab/home.dart';
import 'package:youtube_lite_raj/SplashScreens.dart';

import 'AllTab/popular.dart';


void main(){
  runApp(YoutubeLite());
}


class YoutubeLite extends StatefulWidget {
  const YoutubeLite({super.key});

  @override
  State<YoutubeLite> createState() => _YoutubeLiteState();
}

class _YoutubeLiteState extends State<YoutubeLite> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class Main_HomeScreens extends StatelessWidget {
  const Main_HomeScreens({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
            )),
        title: Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: TextFormField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    )),
                hintText: 'Search here...',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                labelStyle: TextStyle(color: Colors.white),
                filled: true,
                // Enable the background color
                fillColor: Colors.white12,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: Colors.grey,
              ))
        ],
      ),
      body: DefaultTabController(
        length: 7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              indicatorColor: Colors.red,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.white,
              isScrollable: true,
              // ট্যাব স্ক্রলযোগ্য হবে

              tabs: [
                Tab(
                  text: 'For You',
                ),
                Tab(
                  text: 'Tranding',
                ),
                Tab(
                  text: 'Song & Movie',
                ),
                Tab(
                  text: 'Sport',
                ),
                Tab(
                  text: 'News',
                ),
                Tab(
                  text: 'Motivation',
                ),
                Tab(
                  text: 'Islamic',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                Home(),
                Popular(),
                Songmovie(),
                Sports(),
                News(),
                Motivation(),
                Islamic(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
