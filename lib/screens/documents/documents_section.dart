import 'package:flelobna/constants/app_colors.dart';
import 'package:flelobna/screens/documents/widgets/video_screen.dart';
import 'package:flutter/material.dart';

class DocumentsSection extends StatelessWidget {
  const DocumentsSection({
    super.key,
    required this.videoAssets,
    this.title,
    this.description,
    this.name,
    this.direction,
    this.inspectrice,
  });

  final List<String> videoAssets;
  final String? title;
  final String? name;
  final String? description;
  final String? direction;
  final String? inspectrice;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      // padding: EdgeInsets.all(size.width * 0.04),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (String videoAsset in videoAssets)
              ExpansionTile(
                // backgroundColor: AppColors.whiteFlue,
                initiallyExpanded: false,
                title: Text(
                  title.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: size.width * 0.003,
                    color: AppColors.blueTextColor,
                    // decoration: TextDecoration.underline,
                  ),
                ),
                children: <Widget>[
                  Container(
                    width: size.width,
                    height: size.height * 0.34,
                    // margin: EdgeInsets.only(bottom: 16.0),
                    child: VideoPlayerWidget(videoAsset: videoAsset),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  SizedBox(
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          (description != null && description != " ")
                              ? Text(
                                  description.toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: size.width * 0.003,
                                    color: AppColors.blueTextColor,
                                    // decoration: TextDecoration.underline,
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          (name != null && description != " ")
                              ? Text(
                                  name.toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: size.width * 0.003,
                                    color: AppColors.blueTextColor,
                                    // decoration: TextDecoration.underline,
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          (direction != null && description != " ")
                              ? Text(
                                  direction.toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: size.width * 0.003,
                                    color: AppColors.blueTextColor,
                                    // decoration: TextDecoration.underline,
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          (inspectrice != null && description != " ")
                              ? Text(
                                  inspectrice.toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: size.width * 0.003,
                                    color: AppColors.blueTextColor,
                                    // decoration: TextDecoration.underline,
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}
