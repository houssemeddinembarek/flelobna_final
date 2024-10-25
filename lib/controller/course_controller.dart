import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flelobna/models/commentaire.dart';
import 'package:flelobna/models/course.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:permission_handler/permission_handler.dart';

class CourseController extends GetxController {
  final RxList<Course> coursesList = <Course>[].obs;
  var courses = <Course>[].obs;
  var filteredList = <Course>[].obs;
  var commentaire = Rx<Commentaire>(Commentaire());
  var courseDetail = Rx<Course>(Course());

  @override
  void onInit() {
    fetchCourses();
    print('controller working');
    super.onInit();
  }

  Future<void> fetchCourses() async {
    FirebaseFirestore.instance
        .collection('courses')
        .snapshots()
        .listen((querySnapshot) {
      courses.value = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        // Assuming commentaire is a list of maps. Adjust if your structure is different.
        List<Commentaire> commentaires = [];
        if (data['commentaire'] != null) {
          commentaires = List<Map<String, dynamic>>.from(data['commentaire'])
              .map((commentData) {
            return Commentaire.fromMap(commentData);
          }).toList();
        }
        return Course(
          name: data['name'] ?? '',
          description: data['description'] ?? '',
          pathPdf: data['pathPdf'] ?? '',
          couverture: data['couverture'] ?? '',
          size: data['size'] ?? '',
          commentaire:
              commentaires, // Ensure this is correctly handled in your Course model
        );
      }).toList();
      filterList(''); // Update your UI or perform further actions as needed
    });

    // These prints will likely execute before your data is fetched due to the asynchronous nature of snapshots().
    // Consider using setState() or another method to update your UI after data is fetched if this is within a StatefulWidget.
  }

  Future<Course?> getCourseByName(String courseName) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    try {
      var querySnapshot = await db
          .collection('courses')
          .where('name', isEqualTo: courseName)
          .limit(1)
          .get();

      // Check if the query returned any documents
      if (querySnapshot.docs.isNotEmpty) {
        // Assuming you have a fromMap method to parse your Course object
        Map<String, dynamic> data =
            querySnapshot.docs.first.data() as Map<String, dynamic>;
        Course course = Course.fromMap(data);
        courseDetail.value = course;
        return course; // Return the found Course object
      } else {
        print("No course found with the name $courseName");
        return null; // Return null if no course is found
      }
    } catch (e) {
      print("Error fetching course by name: $e");
      return null; // Return null if an error occurs
    }
  }

  void filterList(String query) {
    print(query);
    filteredList.clear();
    filteredList.assignAll(courses.where(
        (item) => item.name!.toLowerCase().contains(query.toLowerCase())));
    print('=======');
    print(filteredList.value.map((element) => print(element.toJson())));
    print('=======');
    print('=======');
    print(courses.value);
    print('=======');
  }

  Future<void> addCommentToCourseByName(
      String courseName, Commentaire comment) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference courses = db.collection('courses');
    try {
      QuerySnapshot querySnapshot =
          await courses.where('name', isEqualTo: courseName).get();
      if (querySnapshot.docs.isNotEmpty) {
        DocumentReference courseRef = querySnapshot.docs.first.reference;
        await courseRef.update({
          'commentaire': FieldValue.arrayUnion([comment.toJson()]),
        });

        print("Comment added successfully.");
      } else {
        print("No course found with the name $courseName.");
      }
    } catch (e) {
      print("Error adding comment: $e");
    }
  }

  Future<void> setFavoriteCourse(String courseName, int favorite) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference courses = db.collection('courses');
    try {
      QuerySnapshot querySnapshot =
          await courses.where('name', isEqualTo: courseName).get();
      if (querySnapshot.docs.isNotEmpty) {
        DocumentReference courseRef = querySnapshot.docs.first.reference;
        await courseRef.update({
          'favorite': favorite,
        });
        print("favorite updated successfully.");
      } else {
        print("No favorite found with the name $courseName.");
      }
    } catch (e) {
      print("Error adding favorite: $e");
    }
  }

  Future<void> downloadFirebasePDF(String storageUrl) async {
    try {
      final ref =
          firebase_storage.FirebaseStorage.instanceFor().refFromURL(storageUrl);

      final directory = await getApplicationDocumentsDirectory();
      final String localFilePath =
          '${directory.path}/downloaded.pdf'; // Define a valid file path

      final File file = File(localFilePath);

      // Download the file to the local storage
      await ref.writeToFile(file);

      // Save the file to the device's gallery or document folder
      final savedFile = await file.copy('${directory.path}/downloaded.pdf');

      print('PDF downloaded and saved to: ${savedFile.path}');
    } catch (e) {
      print('Error downloading PDF: $e');
    }
  }

  Future<void> downloadPdfFromAssets(String) async {
    final fileUrl =
        'file:///assets/files/doc.pdf'; // File URL to identify the asset

    // Initialize the CacheManager
    final cacheManager = DefaultCacheManager();

    try {
      // Get the file from the cache or download it if not cached
      final file = await cacheManager.getSingleFile(fileUrl);

      // Get the path to the downloaded file
      final filePath = file.path;

      // Now, you can use 'filePath' to access the downloaded PDF
      print('PDF downloaded to: $filePath');

      // You can open and display the PDF using your preferred PDF viewer or widget
      // Example: Open the PDF using the 'pdf_viewer' package
      // await PDFViewer.openFile(filePath);
    } catch (e) {
      print('Error downloading PDF: $e');
    }
  }

  downloadFile(var filePath, var documentUrl) async {
    try {
      /// setting filename
      final filename = filePath;
      String dir = (await getApplicationDocumentsDirectory()).path;
      if (await File('$dir/$filename').exists()) return File('$dir/$filename');

      String url = documentUrl;

      /// requesting http to get url
      var request = await HttpClient().getUrl(Uri.parse(url));

      /// closing request and getting response
      var response = await request.close();

      /// getting response data in bytes
      var bytes = await consolidateHttpClientResponseBytes(response);

      /// generating a local system file with name as 'filename' and path as '$dir/$filename'
      File file = new File('$dir/$filename');

      /// writing bytes data of response in the file.
      await file.writeAsBytes(bytes);

      return file;
    } catch (err) {
      print(err);
    }
  }

  Future<void> savePdfToDevice(String assetPath, String fileName) async {
    try {
      // Request storage permission
      var status = await Permission.storage.request();
      if (status.isGranted) {
        // Load the PDF from assets
        final byteData = await rootBundle.load(assetPath);

        // Get the directory to store files
        final directory = (await getApplicationDocumentsDirectory()).path;

        // Create the file in the device's file system
        final file = File('$directory/$fileName');

        // Write the PDF file bytes to the file in the device's file system
        await file.writeAsBytes(byteData.buffer
            .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

        print("PDF saved to $directory/$fileName");
      } else {
        // Handle the case where the user does not grant permission
        print("Storage permission not granted");
      }
    } catch (e) {
      print("Error saving PDF to device: $e");
    }
  }

  Future<void> downloadAndSaveFile(String url, String fileName) async {
    // Getting the directory where you can store files
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$fileName';
    final dio = Dio();

    try {
      // Downloading
      final response = await dio.download(url, filePath);
      if (response.statusCode == 200) {
        print("File downloaded to $filePath");
      } else {
        print("Failed to download the file: ${response.statusMessage}");
      }
    } catch (e) {
      print("Error downloading the file: $e");
    }
  }
}
