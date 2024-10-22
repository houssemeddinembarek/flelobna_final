import 'package:flelobna/constants/app_colors.dart';
import 'package:flelobna/screens/documents/documents_section.dart';
import 'package:flutter/material.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Liste des Videos'),
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
        body: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.blueBgTop, AppColors.blueBgBottom],
            ),
          ),
          child: const TabBarView(
            children: [
              DocumentsSection(
                title:
                    "Le document audiovisuel du programme de la 11 ème année",
                description:
                    "Le document audiovisuel de la 11ème année est réalisé par l'enseignante :",
                name: "Noura Al Ajmi",
                direction:
                    "Sous la direction du chef de département Mme Raoudha Boujmaieh",
                inspectrice: "L'inspectrice technique Mme Rafa Alguenai",
                videoAssets: [
                  'assets/video/video11.mp4',
                  // 'assets/video/video12.mp4'
                ],
              ),
              DocumentsSection(
                title:
                    "Le document audiovisuel du programme de la 12 ème année",
                description:
                    "Ce document audiovisuel est réalisé par les enseignates",
                name: "Chahd Alhamdan - Imen Ramzi - Dalal Al Shummeri",
                direction:
                    "Sous la direction du chef de département Mme Raoudha Boujnaieh",
                inspectrice: "Mme Rafa Alguenai",
                videoAssets: [
                  // 'assets/video/video11.mp4',
                  'assets/video/video12.mp4'
                ],
              ),
              // Center(child: Text('11 eme Content')),
              // Center(child: Text('12 eme Content')),
              SingleChildScrollView(
                child: Column(
                  children: [
                    DocumentsSection(
                      title:
                          "Le document audiovisuel du programme de la 11 ème année",
                      // description:
                      // "Le document audiovisuel de la 11ème année est réalisé par l'enseignante :",
                      // name: "Noura Al Ajmi",
                      // direction: "Sous la direction du chef de département Mme Raoudha Boujmaieh",
                      // inspectrice: "L'inspectrice technique Mme Rafa Alguenai",
                      videoAssets: [
                        'assets/video/1.mp4',
                        // 'assets/video/video12.mp4'
                      ],
                    ),
                    DocumentsSection(
                      title:
                          "Le document audiovisuel du programme de la 11 ème année",
                      description:
                          "Le document audiovisuel de la 11ème année est réalisé par l'enseignante :",
                      name: "Noura Al Ajmi",
                      direction:
                          "Sous la direction du chef de département Mme Raoudha Boujmaieh",
                      inspectrice: "L'inspectrice technique Mme Rafa Alguenai",
                      videoAssets: [
                        'assets/video/2.mp4',
                        // 'assets/video/video12.mp4'
                      ],
                    ),
                    DocumentsSection(
                      title:
                          "Le document audiovisuel du programme de la 11 ème année",
                      description:
                          "Le document audiovisuel de la 11ème année est réalisé par l'enseignante :",
                      name: "Noura Al Ajmi",
                      direction:
                          "Sous la direction du chef de département Mme Raoudha Boujmaieh",
                      inspectrice: "L'inspectrice technique Mme Rafa Alguenai",
                      videoAssets: [
                        'assets/video/3.mp4',
                        // 'assets/video/video12.mp4'
                      ],
                    ),
                    DocumentsSection(
                      title:
                          "Le document audiovisuel du programme de la 11 ème année",
                      description:
                          "Le document audiovisuel de la 11ème année est réalisé par l'enseignante :",
                      name: "Noura Al Ajmi",
                      direction:
                          "Sous la direction du chef de département Mme Raoudha Boujmaieh",
                      inspectrice: "L'inspectrice technique Mme Rafa Alguenai",
                      videoAssets: [
                        'assets/video/4.mp4',
                        // 'assets/video/video12.mp4'
                      ],
                    ),
                    DocumentsSection(
                      title:
                          "Le document audiovisuel du programme de la 11 ème année",
                      description:
                          "Le document audiovisuel de la 11ème année est réalisé par l'enseignante :",
                      name: "Noura Al Ajmi",
                      direction:
                          "Sous la direction du chef de département Mme Raoudha Boujmaieh",
                      inspectrice: "L'inspectrice technique Mme Rafa Alguenai",
                      videoAssets: [
                        'assets/video/5.mp4',
                        // 'assets/video/video12.mp4'
                      ],
                    ),
                    DocumentsSection(
                      title:
                          "Le document audiovisuel du programme de la 11 ème année",
                      description:
                          "Le document audiovisuel de la 11ème année est réalisé par l'enseignante :",
                      name: "Noura Al Ajmi",
                      direction:
                          "Sous la direction du chef de département Mme Raoudha Boujmaieh",
                      inspectrice: "L'inspectrice technique Mme Rafa Alguenai",
                      videoAssets: [
                        'assets/video/6.mp4',
                        // 'assets/video/video12.mp4'
                      ],
                    ),
                    DocumentsSection(
                      title:
                          "Le document audiovisuel du programme de la 11 ème année",
                      description:
                          "Le document audiovisuel de la 11ème année est réalisé par l'enseignante :",
                      name: "Noura Al Ajmi",
                      direction:
                          "Sous la direction du chef de département Mme Raoudha Boujmaieh",
                      inspectrice: "L'inspectrice technique Mme Rafa Alguenai",
                      videoAssets: [
                        'assets/video/7.mp4',
                        // 'assets/video/video12.mp4'
                      ],
                    ),
                    DocumentsSection(
                      title:
                          "Le document audiovisuel du programme de la 11 ème année",
                      description:
                          "Le document audiovisuel de la 11ème année est réalisé par l'enseignante :",
                      name: "Noura Al Ajmi",
                      direction:
                          "Sous la direction du chef de département Mme Raoudha Boujmaieh",
                      inspectrice: "L'inspectrice technique Mme Rafa Alguenai",
                      videoAssets: [
                        'assets/video/8.mp4',
                        // 'assets/video/video12.mp4'
                      ],
                    ),
                    DocumentsSection(
                      title:
                          "Le document audiovisuel du programme de la 11 ème année",
                      description:
                          "Le document audiovisuel de la 11ème année est réalisé par l'enseignante :",
                      name: "Noura Al Ajmi",
                      direction:
                          "Sous la direction du chef de département Mme Raoudha Boujmaieh",
                      inspectrice: "L'inspectrice technique Mme Rafa Alguenai",
                      videoAssets: [
                        'assets/video/9.mp4',
                        // 'assets/video/video12.mp4'
                      ],
                    ),
                    DocumentsSection(
                      title:
                          "Le document audiovisuel du programme de la 11 ème année",
                      description:
                          "Le document audiovisuel de la 11ème année est réalisé par l'enseignante :",
                      name: "Noura Al Ajmi",
                      direction:
                          "Sous la direction du chef de département Mme Raoudha Boujmaieh",
                      inspectrice: "L'inspectrice technique Mme Rafa Alguenai",
                      videoAssets: [
                        'assets/video/10.mp4',
                        // 'assets/video/video12.mp4'
                      ],
                    ),
                    DocumentsSection(
                      title:
                          "Le document audiovisuel du programme de la 11 ème année",
                      description:
                          "Le document audiovisuel de la 11ème année est réalisé par l'enseignante :",
                      name: "Noura Al Ajmi",
                      direction:
                          "Sous la direction du chef de département Mme Raoudha Boujmaieh",
                      inspectrice: "L'inspectrice technique Mme Rafa Alguenai",
                      videoAssets: [
                        'assets/video/11.mp4',
                        // 'assets/video/video12.mp4'
                      ],
                    ),
                    DocumentsSection(
                      title:
                          "Le document audiovisuel du programme de la 11 ème année",
                      description:
                          "Le document audiovisuel de la 11ème année est réalisé par l'enseignante :",
                      name: "Noura Al Ajmi",
                      direction:
                          "Sous la direction du chef de département Mme Raoudha Boujmaieh",
                      inspectrice: "L'inspectrice technique Mme Rafa Alguenai",
                      videoAssets: [
                        'assets/video/12.mp4',
                        // 'assets/video/video12.mp4'
                      ],
                    ),DocumentsSection(
                      title:
                          "Le document audiovisuel du programme de la 11 ème année",
                      description:
                          "Le document audiovisuel de la 11ème année est réalisé par l'enseignante :",
                      name: "Noura Al Ajmi",
                      direction:
                          "Sous la direction du chef de département Mme Raoudha Boujmaieh",
                      inspectrice: "L'inspectrice technique Mme Rafa Alguenai",
                      videoAssets: [
                        'assets/video/13.mp4',
                        // 'assets/video/video12.mp4'
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
