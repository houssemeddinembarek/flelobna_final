import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flelobna/models/user.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var userDetail = Rx<User>(User());
  var loadinSettingsScreen = false.obs;

  Future<User?> getUserByEmail(String userEmail) async {
    loadinSettingsScreen.value = true;
    print(userEmail);
    FirebaseFirestore db = FirebaseFirestore.instance;
    try {
      var querySnapshot = await db
          .collection('users')
          .where('email', isEqualTo: userEmail)
          .limit(1)
          .get();

      // Check if the query returned any documents
      if (querySnapshot.docs.isNotEmpty) {
        // Assuming you have a fromMap method to parse your Course object
        Map<String, dynamic> data =
            querySnapshot.docs.first.data() as Map<String, dynamic>;
        User course = User.fromMap(data);

        userDetail.value = course;
        loadinSettingsScreen.value = false;

        return course;
      } else {
        print("No course found with the name $userDetail");
        loadinSettingsScreen.value = false;

        return null; // Return null if no course is found
      }
    } catch (e) {
      print("Error fetching course by name: $e");
      return null; // Return null if an error occurs
    }
  }
}
