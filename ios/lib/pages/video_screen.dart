import 'package:flutter/material.dart';
import 'package:testsdk/models/cours.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoScreen extends StatelessWidget {
  final List<String> videoAssets;

  VideoScreen({
    Key? key,
    required this.videoAssets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Document de la 11 ème année'),
        elevation: 0,
        backgroundColor: Color(0xFF192E5B),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.cyan, Colors.blueGrey],
            ),
          ),
          padding: EdgeInsets.all(size.width * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.04,
              ),
              for (String videoAsset in videoAssets)
                Container(
                  height: size.height * 0.3,
                  margin: EdgeInsets.only(bottom: 16.0),
                  child: VideoPlayerWidget(videoAsset: videoAsset),
                ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                width: size.width * 0.9,
                height: size.height * 0.4,
                padding: EdgeInsets.all(size.width * 0.04),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Le document audiovisuel du programme de la 11 ème année ",
                      style: TextStyle(
                        fontSize: size.width * 0.05,
                        // letterSpacing: size.width * 0.004,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        // shadows: [
                        //   Shadow(
                        //     color: Colors.black,
                        //     offset: Offset(0.1, 0.1),
                        //     blurRadius: 3,
                        //   ),
                        // ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      "Ce document audiovisuel est réalisé par l'enseignante",
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        // letterSpacing: size.width * 0.004,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        // shadows: [
                        //   Shadow(
                        //     color: Colors.black,
                        //     offset: Offset(0.1, 0.1),
                        //     blurRadius: 3,
                        //   ),
                        // ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      "Noura Al Ajmi",
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        // letterSpacing: size.width * 0.004,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      "Sous la direction du chef de département Mme Raoudha Boujnaieh ",
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        // letterSpacing: size.width * 0.004,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      "L'inspectrice technique Mme Rafa Alguenai",
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        // letterSpacing: size.width * 0.004,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoAsset;

  VideoPlayerWidget({
    Key? key,
    required this.videoAsset,
  }) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.videoAsset);

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9, // Adjust aspect ratio according to your video
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    // Dispose of the video controller when the widget is disposed.
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(controller: _chewieController);
  }
}

void main() {
  runApp(
    MaterialApp(
      home: VideoScreen(
        videoAssets: ['assets/video/video11.mp4', 'assets/video/video12.mp4'],
      ),
    ),
  );
}
