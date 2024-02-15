import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flelobna/constants/app_colors.dart';
import 'package:flelobna/controller/course_controller.dart';
import 'package:flelobna/models/commentaire.dart';
import 'package:flelobna/models/course.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DetailCourse extends StatefulWidget {
  DetailCourse({Key? key, required this.course});

  Course course;

  @override
  State<DetailCourse> createState() => _DetailCourseState();
}

class _DetailCourseState extends State<DetailCourse> {
  double _width = 100.0;

  double _height = 100.0;

  Color _color = AppColors.blueBgTop;
  Color favorite = AppColors.whiteFlue;
  final getStorage = GetStorage();

  CourseController courseController = Get.put(CourseController());

  TextEditingController commentaireController = TextEditingController();
  BorderRadiusGeometry _borderRadius = BorderRadius.only(
      topLeft: Radius.circular(8), topRight: Radius.circular(8));

  void _animateContainer() {
    setState(() {
      _width = _width == 100.0 ? 300.0 : 100.0;
      _height =
      _height == 100.0 ? MediaQuery
          .of(context)
          .size
          .height * 0.5 : 100.0;
      _color = _color == AppColors.blueBgTop
          ? AppColors.blueBgTop
          : AppColors.blueBgTop;
      // Randomly change the border radius
      _borderRadius = _borderRadius ==
          BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))
          ? BorderRadius.only(
          topLeft: Radius.circular(25), topRight: Radius.circular(25))
          : BorderRadius.only(
          topLeft: Radius.circular(8), topRight: Radius.circular(8));
    });
  }

  @override
  void initState() {
    courseController.getCourseByName(widget.course.name.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Document PDF',
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
      body: Stack(
        children: [
          Container(
            height: size.height * 0.9,
            width: size.width,
            child: SfPdfViewer.network(
              widget.course.pathPdf!,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => _animateContainer(),
              child: AnimatedContainer(
                // Use the properties that can change
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: _borderRadius,
                ),
                // Set the duration of the animation
                duration: Duration(seconds: 1),
                // Optional: use a curve for the animation
                curve: Curves.fastOutSlowIn,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Icon(
                      Icons.arrow_upward,
                      color: AppColors.whiteFlue,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      width: size.height * 0.7,
                      alignment: Alignment.centerRight,
                      padding:
                      EdgeInsets.symmetric(horizontal: size.width * 0.08),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Commentaires',
                            style: TextStyle(
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold,
                              letterSpacing: size.width * 0.003,
                              color: AppColors.blueTextColor,
                              // decoration: TextDecoration.underline,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              setState(() {
                                favorite == Colors.red.withOpacity(0.8)
                                    ? favorite = AppColors.whiteFlue
                                    : favorite = Colors.red.withOpacity(0.8);
                              });
                              Course? course = await courseController
                                  .getCourseByName(widget.course.name!);
                              print('this is a print');
                              print(course?.toJson());
                            },
                            child: Icon(
                              Icons.favorite,
                              color: favorite,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    SizedBox(
                      height: size.height * 0.06,
                      width: size.width * 0.9,
                      child: TextFormField(
                        controller: commentaireController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.04,
                              vertical: size.height * 0.02),
                          filled: true,
                          fillColor: AppColors.whiteFlue,
                          suffixIcon: Icon(
                            Icons.message,
                            color: AppColors.blue,
                          ),
                          hintText: 'Ecrire un commentaire',
                          hintStyle:
                          TextStyle(color: AppColors.blue.withOpacity(0.7)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.whiteFlue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.whiteFlue),
                          ),
                        ),
                        onChanged: (value) {
                          courseController.commentaire.value.content = value;
                        },
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    ElevatedButton(
                      onPressed: () async {
                        print(getStorage.read('email'));
                        courseController.commentaire.value.createdAt =
                            DateTime.now();
                        courseController.commentaire.value.userId =
                            getStorage.read('email');
                        AwesomeDialog(
                            context: context,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            btnOkIcon: Icons.add_circle_outline,
                            btnCancelIcon: Icons.cancel,
                            dialogType: DialogType.warning,
                            animType: AnimType.rightSlide,
                            title: 'Ajouter un commentaire',
                            desc:
                            'Êtes-vous sûr de vouloir ajouter un commentaire ?',
                            btnOkColor: Colors.green,
                            btnOkText: 'Valider',
                            buttonsTextStyle:
                            TextStyle(color: Colors.white),
                            btnOkOnPress: () async {
                              commentaireController.clear();
                              if (commentaireController.text != null ) {
                                await courseController
                                    .addCommentToCourseByName(
                                    widget.course.name!,
                                    courseController
                                        .commentaire.value);
                              }
                              courseController
                                  .getCourseByName(widget.course.name!);
                            },
                            btnCancelOnPress: () {})
                            .show();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.blueBgTop),
                        shadowColor: MaterialStateProperty.all(Colors.black),
                      ),
                      child: Text(
                        'Ajouter',
                        style: TextStyle(color: AppColors.whiteFlue),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      height: size.height * 0.22,
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                        // color: AppColors.blue.withOpacity(0.3),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Obx(() =>
                          ListView.separated(
                            separatorBuilder: (context, index) {
                              return SizedBox(height: size.height * 0.01);
                            },
                            itemCount: courseController
                                .courseDetail.value.commentaire?.length ??
                                0,
                            itemBuilder: (context, index) {
                              Commentaire comment = courseController
                                  .courseDetail.value.commentaire![index];
                              return comment.content != null
                                  ? Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                    color:
                                    AppColors.blue.withOpacity(0.3),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10))),
                                child: Column(
                                  children: [
                                    Text(
                                      comment.content.toString(),
                                      // Added null check for content
                                      style: TextStyle(
                                          color: AppColors.whiteFlue),
                                    ),
                                  ],
                                ),
                              )
                                  : Container(
                                child: Center(
                                  child: Text("No content"),
                                ),
                              );
                            },
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
