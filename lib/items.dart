import 'package:flutter/material.dart';
import 'package:youtube_lite_raj/YoutubePlayer.dart';
import 'package:youtube_lite_raj/main.dart';

class Items extends StatelessWidget {
  const Items({
    super.key,
    required this.thumbnailUrl,
    required this.title,
    required this.channelTitle,
    required this.formattedViews,
    required this.videoId,
  });

  final dynamic thumbnailUrl;
  final dynamic title;
  final dynamic videoId;
  final dynamic channelTitle;
  final String formattedViews;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _onTapClick(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
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
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 25, // ✅ ইমেজ সাইজ ঠিক রাখতে পারেন
                  backgroundImage: NetworkImage(thumbnailUrl), // ✅ ব্যাকগ্রাউন্ড ইমেজ ব্যবহার করুন
                ),
                SizedBox(
                  width: 13,
                ),
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
                          Text(
                            channelTitle,
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("$formattedViews"),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '3 days ago',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }



  void _onTapClick(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPlayer(
          videoId: videoId,
          text: videoId,
        ),
      ),
    );
  }
}
