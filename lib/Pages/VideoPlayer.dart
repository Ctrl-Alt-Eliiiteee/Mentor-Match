import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class Videoplayer extends StatefulWidget {
  @override
  _VideoplayerState createState() => _VideoplayerState();
}

VideoPlayerController videoPlayerController;
ChewieController chewieController;

class _VideoplayerState extends State<Videoplayer> {
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            child: Center(
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PlayVideo()));
                },
                child: Text('Play Video'),
              ),
            )),
      ),
    );
  }
}

class PlayVideo extends StatefulWidget {
  @override
  _PlayVideoState createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        overlay: Text('Title of the video'),
        aspectRatio: 16 / 9,
        autoPlay: true);
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
              height: 300, child: Chewie(controller: chewieController))),
    );
  }
}
