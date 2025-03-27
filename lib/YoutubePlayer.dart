import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key, required this.videoId, required this.text,});

  final String videoId;
  final String text;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}


class _VideoPlayerState extends State<VideoPlayer> {


  late YoutubePlayerController _controller;


  @override
  void initState() {
    _controller= YoutubePlayerController(initialVideoId: widget.videoId);
    // TODO: implement initState
    super.initState();
  }




  @override
  Widget build(BuildContext context, ) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            YoutubePlayer(controller: _controller),
            Text(widget.text)

          ],
        ),
      ),
    );
  }
}
