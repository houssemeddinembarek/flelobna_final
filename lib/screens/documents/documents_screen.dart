import 'package:flelobna/constants/app_colors.dart';
import 'package:flelobna/controller/video_controller.dart';
import 'package:flelobna/screens/documents/documents_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentsScreen extends StatelessWidget {
  DocumentsScreen({super.key});

  VideoController videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 3, // Number of tabs
        child: Scaffold(
          appBar: AppBar(
            title:  Text('Liste des Videos'),
            centerTitle: false,
            backgroundColor: AppColors.blueBgTop,
            titleTextStyle: TextStyle(
              fontSize: size.width * 0.05,
              fontWeight: FontWeight.bold,
              letterSpacing: size.width * 0.003,
              color: AppColors.blueTextColor,
            ),
            bottom: TabBar(
              labelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                // letterSpacing: size.width * 0.003,
                color: AppColors.blueTextColor,
                // decoration: TextDecoration.underline,
              ),
              tabs: [
                Tab(
                  text: '11 eme',
                ),
                Tab(text: '12 eme'),
                Tab(text: 'Fle'),
              ],
            ),
          ),
          body: Obx(
            () => videoController.fetchVideoLoading == false
                ? Container(
                    height: size.height,
                    width: size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.blueBgTop, AppColors.blueBgBottom],
                      ),
                    ),
                    child: TabBarView(
                      children: [
                        SizedBox(
                          height: size.height,
                          width: size.width,
                          child: ListView.builder(
                            itemCount: videoController.videosCategory11.length,
                            itemBuilder: (BuildContext context, int index) {
                              return DocumentsSection(
                                title: videoController
                                    .videosCategory11.value[index].title,
                                description: videoController
                                    .videosCategory11.value[index].description,
                                name: videoController
                                    .videosCategory11.value[index].name,
                                direction: videoController
                                    .videosCategory11.value[index].direction,
                                inspectrice: videoController
                                    .videosCategory11.value[index].inspectrice,
                                videoAssets: [
                                  videoController
                                      .videosCategory11.value[index].videoPath,
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: size.height,
                          width: size.width,
                          child: ListView.builder(
                            itemCount: videoController.videosCategory12.length,
                            itemBuilder: (BuildContext context, int index) {
                              return DocumentsSection(
                                title: videoController
                                    .videosCategory12.value[index].title,
                                description: videoController
                                    .videosCategory12.value[index].description,
                                name: videoController
                                    .videosCategory12.value[index].name,
                                direction: videoController
                                    .videosCategory12.value[index].direction,
                                inspectrice: videoController
                                    .videosCategory12.value[index].inspectrice,
                                videoAssets: [
                                  videoController
                                      .videosCategory12.value[index].videoPath,
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: size.height,
                          width: size.width,
                          child: ListView.builder(
                            itemCount: videoController.videosCategoryFle.length,
                            itemBuilder: (BuildContext context, int index) {
                              return DocumentsSection(
                                title: videoController
                                    .videosCategoryFle.value[index].title,
                                videoAssets: [
                                  videoController
                                      .videosCategoryFle.value[index].videoPath,
                                ],
                              );
                            },
                          ),
                        )

                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ));
  }
}
