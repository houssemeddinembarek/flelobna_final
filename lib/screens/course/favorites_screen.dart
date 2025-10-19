import 'package:flelobna/constants/app_colors.dart';
import 'package:flelobna/models/course.dart';
import 'package:flelobna/screens/course/detail_course.dart';
import 'package:flelobna/viewmodels/course_viewmodel.dart';
import 'package:flelobna/viewmodels/favorite_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final FavoriteViewModel _favoriteVM = Get.find<FavoriteViewModel>();
  final CourseViewModel _courseVM = Get.find<CourseViewModel>();
  final GetStorage _storage = GetStorage();

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final userEmail = _storage.read('email') ?? '';
    if (userEmail.isNotEmpty) {
      await _favoriteVM.loadUserFavorites(userEmail);
      // Force refresh the observable
      _favoriteVM.favoriteCourses.refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.blueBgTop,
              AppColors.GreeFonce,
              AppColors.blueBgBottom,
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Custom Header
              _buildHeader(size),
              
              // Favorites Content
              Expanded(
                child: Obx(() {
                  if (_favoriteVM.isLoading.value) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    );
                  }

                  if (_favoriteVM.favoriteCourses.isEmpty) {
                    return _buildEmptyState(size);
                  }

                  // Get favorite courses from all courses
                  final favoriteCoursesList = _courseVM.courses
                      .where((course) => _favoriteVM.favoriteCourses.contains(course.name))
                      .toList();

                  if (favoriteCoursesList.isEmpty) {
                    return _buildEmptyState(size);
                  }

                  return RefreshIndicator(
                    onRefresh: _loadFavorites,
                    color: AppColors.GreeFonce,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(size.width * 0.04),
                      itemCount: favoriteCoursesList.length,
                      itemBuilder: (context, index) {
                        return _buildCourseCard(
                          context,
                          size,
                          favoriteCoursesList[index],
                        );
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(Size size) {
    return Container(
      padding: EdgeInsets.all(size.width * 0.04),
      child: Row(
        children: [
          // Back Button
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.arrow_back,
                color: AppColors.GreeFonce,
              ),
            ),
          ),

          SizedBox(width: size.width * 0.04),

          // Title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mes Favoris',
                  style: TextStyle(
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Obx(() => Text(
                      '${_favoriteVM.favoriteCourses.length} revue${_favoriteVM.favoriteCourses.length > 1 ? "s" : ""}',
                      style: TextStyle(
                        fontSize: size.width * 0.035,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    )),
              ],
            ),
          ),

          // Favorite Icon
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.red.withOpacity(0.3),
                width: 1.5,
              ),
            ),
            child: Icon(
              Icons.favorite,
              color: Colors.red,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(Size size) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border_rounded,
            size: size.width * 0.3,
            color: Colors.white.withOpacity(0.5),
          ),
          SizedBox(height: size.height * 0.02),
          Text(
            'Aucun favori',
            style: TextStyle(
              fontSize: size.width * 0.05,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: Text(
              'Commencez à ajouter des revues à vos favoris pour les retrouver facilement ici',
              style: TextStyle(
                fontSize: size.width * 0.035,
                color: Colors.white.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseCard(BuildContext context, Size size, Course course) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 400),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.95 + (0.05 * value),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => DetailCourse(course: course),
            transition: Transition.rightToLeft,
          );
        },
        child: Container(
          margin: EdgeInsets.only(bottom: size.height * 0.02),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.25),
                Colors.white.withOpacity(0.15),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 15,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            children: [
              // Cover Image
              Hero(
                tag: 'course_${course.name}',
                child: Container(
                  width: size.width * 0.28,
                  height: size.width * 0.35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    child: Image.network(
                      course.couverture ?? '',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.GreeFonce,
                                AppColors.GreeMedium,
                              ],
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.book,
                              size: 50,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              // Course Info
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(size.width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              course.name ?? 'Sans titre',
                              style: TextStyle(
                                fontSize: size.width * 0.042,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.3,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 8),
                          // Favorite Icon
                          GestureDetector(
                            onTap: () async {
                              final userEmail = _storage.read('email') ?? '';
                              await _favoriteVM.toggleFavorite(
                                course.name!,
                                userEmail,
                                false, // Removing from favorites
                              );
                              
                              Get.snackbar(
                                'Retiré',
                                'Revue retirée des favoris',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.orange.withOpacity(0.8),
                                colorText: Colors.white,
                                duration: Duration(seconds: 2),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: size.height * 0.01),

                      // Size Tag
                      if (course.size != null && course.size!.isNotEmpty)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.description_outlined,
                                size: 14,
                                color: Colors.white,
                              ),
                              SizedBox(width: 4),
                              Text(
                                course.size!,
                                style: TextStyle(
                                  fontSize: size.width * 0.03,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                      SizedBox(height: size.height * 0.015),

                      // View Button
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.3),
                              Colors.white.withOpacity(0.2),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.4),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.visibility_outlined,
                              size: 16,
                              color: Colors.white,
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Voir la revue',
                              style: TextStyle(
                                fontSize: size.width * 0.032,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

