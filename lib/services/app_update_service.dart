import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class AppUpdateService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Check for app updates on startup
  Future<void> checkForUpdate(BuildContext context) async {
    try {
      // Get current app version
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String currentVersion = packageInfo.version;
      String currentBuildNumber = packageInfo.buildNumber;

      print('Current app version: $currentVersion ($currentBuildNumber)');

      // Get latest version from Firestore
      DocumentSnapshot configDoc = await _firestore
          .collection('app_config')
          .doc('version')
          .get();

      if (!configDoc.exists) {
        print('No version config found in Firestore');
        return;
      }

      Map<String, dynamic> config = configDoc.data() as Map<String, dynamic>;
      
      // Get platform-specific version
      String? latestVersion;
      String? latestBuildNumber;
      bool? forceUpdate;
      String? updateMessage;
      String? storeUrl;

      if (Platform.isAndroid) {
        latestVersion = config['android_version'];
        latestBuildNumber = config['android_build_number']?.toString();
        forceUpdate = config['android_force_update'] ?? false;
        updateMessage = config['android_update_message'];
        storeUrl = config['android_store_url'];
      } else if (Platform.isIOS) {
        latestVersion = config['ios_version'];
        latestBuildNumber = config['ios_build_number']?.toString();
        forceUpdate = config['ios_force_update'] ?? false;
        updateMessage = config['ios_update_message'];
        storeUrl = config['ios_store_url'];
      }

      if (latestVersion == null || latestBuildNumber == null) {
        print('No version info for current platform');
        return;
      }

      print('Latest version: $latestVersion ($latestBuildNumber)');

      // Compare versions
      bool updateAvailable = _isUpdateAvailable(
        currentVersion,
        currentBuildNumber,
        latestVersion,
        latestBuildNumber,
      );

      if (updateAvailable) {
        print('Update available!');
        _showUpdateDialog(
          context,
          forceUpdate: forceUpdate ?? false,
          message: updateMessage ?? 'Une nouvelle version de l\'application est disponible.',
          storeUrl: storeUrl,
          newVersion: latestVersion,
        );
      } else {
        print('App is up to date');
      }
    } catch (e) {
      print('Error checking for updates: $e');
    }
  }

  /// Compare version numbers
  bool _isUpdateAvailable(
    String currentVersion,
    String currentBuild,
    String latestVersion,
    String latestBuild,
  ) {
    try {
      // Compare build numbers (more reliable)
      int currentBuildInt = int.tryParse(currentBuild) ?? 0;
      int latestBuildInt = int.tryParse(latestBuild) ?? 0;

      if (latestBuildInt > currentBuildInt) {
        return true;
      }

      // Fallback to version string comparison
      List<int> current = currentVersion.split('.').map((e) => int.tryParse(e) ?? 0).toList();
      List<int> latest = latestVersion.split('.').map((e) => int.tryParse(e) ?? 0).toList();

      // Pad shorter version with zeros
      while (current.length < latest.length) current.add(0);
      while (latest.length < current.length) latest.add(0);

      for (int i = 0; i < current.length; i++) {
        if (latest[i] > current[i]) return true;
        if (latest[i] < current[i]) return false;
      }

      return false;
    } catch (e) {
      print('Error comparing versions: $e');
      return false;
    }
  }

  /// Show update dialog
  void _showUpdateDialog(
    BuildContext context, {
    required bool forceUpdate,
    required String message,
    String? storeUrl,
    required String newVersion,
  }) {
    showDialog(
      context: context,
      barrierDismissible: !forceUpdate,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => !forceUpdate,
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 16,
            child: Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    Colors.blue.shade50,
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue.shade400,
                          Colors.blue.shade600,
                        ],
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.3),
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.system_update_rounded,
                      size: 48,
                      color: Colors.white,
                    ),
                  ),
                  
                  SizedBox(height: 20),
                  
                  // Title
                  Text(
                    forceUpdate ? 'Mise à jour requise' : 'Mise à jour disponible',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  SizedBox(height: 12),
                  
                  // Version
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Version $newVersion',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade700,
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 16),
                  
                  // Message
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade700,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  SizedBox(height: 24),
                  
                  // Buttons
                  Row(
                    children: [
                      if (!forceUpdate)
                        Expanded(
                          child: TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 1.5,
                                ),
                              ),
                            ),
                            child: Text(
                              'Plus tard',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ),
                      if (!forceUpdate) SizedBox(width: 12),
                      Expanded(
                        flex: forceUpdate ? 1 : 1,
                        child: ElevatedButton(
                          onPressed: () => _openStore(storeUrl),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            backgroundColor: Colors.blue.shade600,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 4,
                          ),
                          child: Text(
                            'Mettre à jour',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  if (forceUpdate) ...[
                    SizedBox(height: 12),
                    Text(
                      'Cette mise à jour est obligatoire pour continuer à utiliser l\'application.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.red.shade700,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Open app store
  Future<void> _openStore(String? storeUrl) async {
    try {
      String url;
      
      if (storeUrl != null && storeUrl.isNotEmpty) {
        url = storeUrl;
      } else {
        // Default store URLs if not provided
        if (Platform.isAndroid) {
          // Replace with your actual package name
          url = 'https://play.google.com/store/apps/details?id=com.flelobna.app';
        } else if (Platform.isIOS) {
          // Replace with your actual App Store ID
          url = 'https://apps.apple.com/app/id123456789';
        } else {
          Get.snackbar(
            'Erreur',
            'Impossible d\'ouvrir le store',
            snackPosition: SnackPosition.BOTTOM,
          );
          return;
        }
      }

      final Uri uri = Uri.parse(url);
      
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        Get.snackbar(
          'Erreur',
          'Impossible d\'ouvrir le store',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print('Error opening store: $e');
      Get.snackbar(
        'Erreur',
        'Une erreur s\'est produite',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

