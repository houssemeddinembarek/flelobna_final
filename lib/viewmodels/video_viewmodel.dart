import 'package:flelobna/data/repositories/video_repository.dart';
import 'package:flelobna/models/video.dart';
import 'package:get/get.dart';

/// ViewModel for Video operations
/// Manages video state and business logic
class VideoViewModel extends GetxController {
  final VideoRepository _repository = VideoRepository();

  // Observable state
  final RxList<Video> allVideos = <Video>[].obs;
  final RxList<Video> videos11 = <Video>[].obs;
  final RxList<Video> videos12 = <Video>[].obs;
  final RxList<Video> videosFle = <Video>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadVideos();
  }

  /// Load all videos
  void _loadVideos() {
    _repository.getVideosStream().listen(
      (videosList) {
        allVideos.value = videosList;
        _categorizeVideos();
      },
      onError: (error) {
        errorMessage.value = 'Error loading videos: $error';
        print(errorMessage.value);
      },
    );
  }

  /// Categorize videos by category
  void _categorizeVideos() {
    videos11.value = allVideos.where((v) => v.category == '11').toList();
    videos12.value = allVideos.where((v) => v.category == '12').toList();
    videosFle.value = allVideos.where((v) => v.category == 'FLE').toList();
  }

  /// Load videos by category
  Future<void> loadVideosByCategory(String category) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      List<Video> videos = await _repository.getVideosByCategory(category);
      
      switch (category) {
        case '11':
          videos11.value = videos;
          break;
        case '12':
          videos12.value = videos;
          break;
        case 'FLE':
          videosFle.value = videos;
          break;
      }
    } catch (e) {
      errorMessage.value = 'Error loading videos: $e';
    } finally {
      isLoading.value = false;
    }
  }

  /// Refresh videos
  Future<void> refreshVideos() async {
    // The stream will automatically update
    return Future.delayed(Duration(milliseconds: 500));
  }

  /// Get videos by category (for immediate access)
  List<Video> getVideosByCategory(String category) {
    switch (category) {
      case '11':
        return videos11;
      case '12':
        return videos12;
      case 'FLE':
        return videosFle;
      default:
        return [];
    }
  }
}

