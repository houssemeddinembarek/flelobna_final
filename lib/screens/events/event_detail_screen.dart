import 'package:flelobna/constants/app_colors.dart';
import 'package:flelobna/models/event.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;

  const EventDetailScreen({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final dateFormat = DateFormat('EEEE dd MMMM yyyy', 'fr_FR');
    final timeFormat = DateFormat('HH:mm');

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
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
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Image with Overlay
              Stack(
                children: [
                  Hero(
                    tag: 'event_${event.id}',
                    child: Container(
                      height: size.height * 0.4,
                      width: size.width,
                      child: Image.network(
                        event.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: Center(
                              child: Icon(
                                Icons.image_not_supported,
                                size: 80,
                                color: Colors.grey[600],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  
                  // Gradient Overlay
                  Container(
                    height: size.height * 0.4,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                          Colors.black.withOpacity(0.8),
                        ],
                        stops: [0.0, 0.5, 1.0],
                      ),
                    ),
                  ),

                  // Back Button
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(size.width * 0.04),
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
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
                    ),
                  ),

                  // Title and Status
                  Positioned(
                    bottom: size.height * 0.02,
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Status Badge
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: _getStatusColor(event),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 8,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            event.status,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        
                        // Title
                        Text(
                          event.title,
                          style: TextStyle(
                            fontSize: size.width * 0.065,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(0, 2),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Content Section
              Container(
                padding: EdgeInsets.all(size.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Date and Time Card
                    _buildInfoCard(
                      size: size,
                      icon: Icons.calendar_today,
                      iconColor: Colors.blue,
                      title: 'Date et Heure',
                      children: [
                        _buildInfoRow(
                          'Début',
                          '${dateFormat.format(event.startDate)}\n${timeFormat.format(event.startDate)}',
                          size,
                        ),
                        if (event.startDate != event.endDate) ...[
                          SizedBox(height: 12),
                          _buildInfoRow(
                            'Fin',
                            '${dateFormat.format(event.endDate)}\n${timeFormat.format(event.endDate)}',
                            size,
                          ),
                        ],
                        if (event.isUpcoming) ...[
                          SizedBox(height: 12),
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: Colors.blue,
                                  size: 20,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  event.daysUntilStart,
                                  style: TextStyle(
                                    fontSize: size.width * 0.04,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),

                    SizedBox(height: size.height * 0.02),

                    // Location Card
                    _buildInfoCard(
                      size: size,
                      icon: Icons.location_on,
                      iconColor: Colors.red,
                      title: 'Lieu',
                      children: [
                        Text(
                          event.location,
                          style: TextStyle(
                            fontSize: size.width * 0.04,
                            color: Colors.grey[800],
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: size.height * 0.02),

                    // Organizer and Category Card
                    _buildInfoCard(
                      size: size,
                      icon: Icons.info_outline,
                      iconColor: Colors.green,
                      title: 'Informations',
                      children: [
                        _buildInfoRow('Organisateur', event.organizer, size),
                        SizedBox(height: 12),
                        _buildInfoRow('Catégorie', event.category, size),
                      ],
                    ),

                    SizedBox(height: size.height * 0.02),

                    // Description Card
                    _buildInfoCard(
                      size: size,
                      icon: Icons.description,
                      iconColor: Colors.purple,
                      title: 'Description',
                      children: [
                        Text(
                          event.description,
                          style: TextStyle(
                            fontSize: size.width * 0.04,
                            color: Colors.grey[800],
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: size.height * 0.03),

                    // Action Button (if upcoming)
                    if (event.isUpcoming || event.isOngoing)
                      Container(
                        width: double.infinity,
                        height: size.height * 0.065,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [AppColors.GreeFonce, AppColors.GreeMedium],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.GreeMedium.withOpacity(0.4),
                              blurRadius: 15,
                              offset: Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Get.snackbar(
                                'Événement',
                                'Ajouté à votre calendrier',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                                icon: Icon(Icons.check_circle, color: Colors.white),
                              );
                            },
                            borderRadius: BorderRadius.circular(15),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.event_available,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  SizedBox(width: 12),
                                  Text(
                                    'Ajouter au calendrier',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: size.width * 0.045,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
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

  Widget _buildInfoCard({
    required Size size,
    required IconData icon,
    required Color iconColor,
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      padding: EdgeInsets.all(size.width * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 24,
                ),
              ),
              SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: size.width * 0.045,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blue,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, Size size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: TextStyle(
              fontSize: size.width * 0.035,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: TextStyle(
              fontSize: size.width * 0.04,
              color: Colors.grey[800],
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(Event event) {
    if (event.isOngoing) return Colors.green;
    if (event.isUpcoming) return Colors.blue;
    return Colors.grey;
  }
}

