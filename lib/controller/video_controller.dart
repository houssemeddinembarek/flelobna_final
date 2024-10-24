import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flelobna/models/video.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxList<Video> videosCategory11 = <Video>[].obs;
  final RxList<Video> videosCategory12 = <Video>[].obs;
  final RxList<Video> videosCategoryFle = <Video>[].obs;
  RxBool fetchVideoLoading = false.obs;

  @override
  void onInit() {

    fetchVideosByCategories();
    super.onInit();
  }

  Future<void> fetchVideosByCategories() async {
    try {
      fetchVideoLoading.value = true;

      // Fetch videos for category "11"
      QuerySnapshot querySnapshot11 = await _firestore
          .collection('video')
          .where('category', isEqualTo: '11')
          .get();
      videosCategory11.value = querySnapshot11.docs.map((doc) {
        return Video.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      // Fetch videos for category "12"
      QuerySnapshot querySnapshot12 = await _firestore
          .collection('video')
          .where('category', isEqualTo: '12')
          .get();
      videosCategory12.value = querySnapshot12.docs.map((doc) {

        return Video.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      // Fetch videos for category "fle"
      QuerySnapshot querySnapshotFle = await _firestore
          .collection('video')
          .where('category', isEqualTo: 'FLE')
          .get();
      videosCategoryFle.value = querySnapshotFle.docs.map((doc) {
        return Video.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      print("/////////");
      print(videosCategory11.value);
      print(videosCategory12.value);
      print(videosCategoryFle.value);
      print("/////////");


      fetchVideoLoading.value = false;
    } catch (e) {
      fetchVideoLoading.value = false;
      print("Error fetching videos by categories: $e");
    }
  }
}
