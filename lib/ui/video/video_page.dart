import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget{

  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage>{
  VideoPlayerController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("tiktok"),
      ),
      body:Text("adasd"),
    );
  }

}