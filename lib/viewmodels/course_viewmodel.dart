import 'package:flelobna/data/repositories/course_repository.dart';
import 'package:flelobna/models/commentaire.dart';
import 'package:flelobna/models/course.dart';
import 'package:get/get.dart';

/// ViewModel for Course operations
/// Manages course state and business logic
class CourseViewModel extends GetxController {
  final CourseRepository _repository = CourseRepository();

  // Observable state
  final RxList<Course> courses = <Course>[].obs;
  final RxList<Course> filteredCourses = <Course>[].obs;
  final Rx<Course> selectedCourse = Course().obs;
  final Rx<Commentaire> newComment = Commentaire().obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadCourses();
  }

  /// Load courses from repository
  void _loadCourses() {
    _repository.getCoursesStream().listen(
      (coursesList) {
        courses.value = coursesList;
        _applyFilter();
      },
      onError: (error) {
        errorMessage.value = 'Error loading courses: $error';
        print(errorMessage.value);
      },
    );
  }

  /// Filter courses by search query
  void filterCourses(String query) {
    searchQuery.value = query;
    _applyFilter();
  }

  /// Apply current filter
  void _applyFilter() {
    filteredCourses.value = _repository.searchCourses(
      courses,
      searchQuery.value,
    );
  }

  /// Get course by name
  Future<void> loadCourseDetails(String courseName) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      Course? course = await _repository.getCourseByName(courseName);
      
      if (course != null) {
        selectedCourse.value = course;
      } else {
        errorMessage.value = 'Course not found';
      }
    } catch (e) {
      errorMessage.value = 'Error loading course details: $e';
    } finally {
      isLoading.value = false;
    }
  }

  /// Add comment to course
  Future<void> addComment({
    required String courseName,
    required String content,
    required String userId,
  }) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      Commentaire comment = Commentaire(
        content: content,
        userId: userId,
        createdAt: DateTime.now(),
      );

      await _repository.addCommentToCourse(courseName, comment);

      // Reload course details
      await loadCourseDetails(courseName);

      Get.snackbar(
        'Succès',
        'Commentaire ajouté avec succès',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      errorMessage.value = 'Error adding comment: $e';
      Get.snackbar(
        'Erreur',
        'Échec de l\'ajout du commentaire',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Delete a comment from a course
  Future<void> deleteComment({
    required String courseName,
    required int commentIndex,
  }) async {
    try {
      isLoading.value = true;
      await _repository.deleteComment(courseName, commentIndex);
      
      // Reload the course to update comments
      Course? updatedCourse = await _repository.getCourseByName(courseName);
      if (updatedCourse != null) {
        selectedCourse.value = updatedCourse;
        // Update in the list as well
        int index = courses.indexWhere((c) => c.name == courseName);
        if (index != -1) {
          courses[index] = updatedCourse;
        }
      }
    } catch (e) {
      errorMessage.value = 'Error deleting comment: $e';
      Get.snackbar(
        'Erreur',
        'Échec de la suppression du commentaire',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Refresh courses
  Future<void> refreshCourses() async {
    // The stream will automatically update
    return Future.delayed(Duration(milliseconds: 500));
  }
}

