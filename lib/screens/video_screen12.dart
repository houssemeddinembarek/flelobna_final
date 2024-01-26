import 'package:chewie/chewie.dart';
import 'package:flelobna/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen12 extends StatelessWidget {
  final List<String> videoAssets;

  VideoScreen12({
    Key? key,
    required this.videoAssets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Document de la 12 ème année',
          style: TextStyle(
            fontSize: size.width * 0.05,
            fontWeight: FontWeight.bold,
            letterSpacing: size.width * 0.003,
            color: AppColors.blueTextColor,
            // decoration: TextDecoration.underline,
          ),
        ),
        elevation: 0,
        backgroundColor: AppColors.blueBgTop,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.blueBgTop, AppColors.blueBgBottom],
          ),
        ),
        padding: EdgeInsets.all(size.width * 0.04),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (String videoAsset in videoAssets)
                Container(
                  height: size.height * 0.3,
                  margin: EdgeInsets.only(bottom: 16.0),
                  child: VideoPlayerWidget(videoAsset: videoAsset),
                ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                width: size.width * 0.9,
                height: size.height * 0.4,
                padding: EdgeInsets.all(size.width * 0.04),
                decoration: BoxDecoration(
                    color: AppColors.whiteFlue,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Le document audiovisuel du programme de la 12 ème année ",
                      style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        letterSpacing: size.width * 0.003,
                        color: AppColors.blueTextColor,
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      "Ce document audiovisuel est réalisé par les enseignantes",
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.bold,
                        letterSpacing: size.width * 0.003,
                        color: AppColors.blueTextColor,
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Chahd Alhamdan",
                              style: TextStyle(
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.bold,
                                letterSpacing: size.width * 0.003,
                                color: AppColors.blueTextColor,
                                // decoration: TextDecoration.underline,
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              "Dalal Al Shummeri",
                              style: TextStyle(
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.bold,
                                letterSpacing: size.width * 0.003,
                                color: AppColors.blueTextColor,
                                // decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Container(
                          child: Text(
                            "Imen Ramzi",
                            style: TextStyle(
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.bold,
                              letterSpacing: size.width * 0.003,
                              color: AppColors.blueTextColor,
                              // decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      "Sous la direction du chef de département ",
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.bold,
                        letterSpacing: size.width * 0.003,
                        color: AppColors.blueTextColor,
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      "Mme Raoudha Boujnaieh ",
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.bold,
                        letterSpacing: size.width * 0.003,
                        color: AppColors.blueTextColor,
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      "Mme Rafa Alguenai",
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.bold,
                        letterSpacing: size.width * 0.003,
                        color: AppColors.blueTextColor,
                        // decoration: TextDecoration.underline,
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
      home: VideoScreen12(
        videoAssets: ['assets/video/video11.mp4', 'assets/video/video12.mp4'],
      ),
    ),
  );
}
