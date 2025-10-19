import 'package:flelobna/data/repositories/favorite_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FavoriteViewModel extends GetxController {
  final FavoriteRepository _repository = FavoriteRepository();
  final GetStorage _storage = GetStorage();

  final RxBool isLoading = false.obs;
  final RxList<String> favoriteCourses = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    _autoLoadFavorites();
  }

  /// Auto-load favorites if user is logged in
  Future<void> _autoLoadFavorites() async {
    final userEmail = _storage.read('email');
    if (userEmail != null && userEmail.toString().isNotEmpty) {
      await loadUserFavorites(userEmail.toString());
    }
  }

  /// Toggle favorite status for a course
  Future<void> toggleFavorite(String courseName, String userEmail, bool isFavorite) async {
    try {
      isLoading.value = true;
      print('Toggling favorite for $courseName: $isFavorite');
      await _repository.toggleFavorite(courseName, userEmail, isFavorite);
      
      // Update local list
      if (isFavorite) {
        if (!favoriteCourses.contains(courseName)) {
          favoriteCourses.add(courseName);
          print('Added $courseName to favorites. Total: ${favoriteCourses.length}');
        }
      } else {
        favoriteCourses.remove(courseName);
        print('Removed $courseName from favorites. Total: ${favoriteCourses.length}');
      }
      favoriteCourses.refresh();
    } catch (e) {
      print('Error in toggleFavorite: $e');
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  /// Check if a course is favorited by a user
  Future<bool> isFavorite(String courseName, String userEmail) async {
    try {
      return await _repository.isFavorite(courseName, userEmail);
    } catch (e) {
      print('Error checking favorite: $e');
      return false;
    }
  }

  /// Load all favorites for a user
  Future<void> loadUserFavorites(String userEmail) async {
    try {
      isLoading.value = true;
      print('Loading favorites for user: $userEmail');
      final favorites = await _repository.getUserFavorites(userEmail);
      print('Loaded ${favorites.length} favorites: $favorites');
      favoriteCourses.value = favorites;
      favoriteCourses.refresh();
    } catch (e) {
      print('Error loading favorites: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

