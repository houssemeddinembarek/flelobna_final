import 'package:flelobna/constants/app_colors.dart';
import 'package:flelobna/models/event.dart';
import 'package:flelobna/screens/events/event_detail_screen.dart';
import 'package:flelobna/viewmodels/event_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EventViewModel viewModel = Get.put(EventViewModel());
    Size size = MediaQuery.of(context).size;

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
        child: SafeArea(
          child: Column(
            children: [
              // Custom Header
              _buildHeader(context, size),
              
              // Events Content
              Expanded(
                child: Obx(() {
                  if (viewModel.isLoading.value && viewModel.events.isEmpty) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    );
                  }

                  if (viewModel.events.isEmpty) {
                    return _buildEmptyState(size);
                  }

                  return RefreshIndicator(
                    onRefresh: viewModel.refreshEvents,
                    color: AppColors.GreeFonce,
                    child: DefaultTabController(
                      length: 3,
                      child: Column(
                        children: [
                          // Tab Bar
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TabBar(
                              indicator: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              labelColor: AppColors.GreeFonce,
                              unselectedLabelColor: Colors.white,
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              tabs: [
                                Tab(text: 'En cours'),
                                Tab(text: 'À venir'),
                                Tab(text: 'Passés'),
                              ],
                            ),
                          ),
                          
                          SizedBox(height: size.height * 0.02),
                          
                          // Tab Views
                          Expanded(
                            child: TabBarView(
                              children: [
                                _buildEventsList(size, viewModel.ongoingEvents, viewModel),
                                _buildEventsList(size, viewModel.upcomingEvents, viewModel),
                                _buildEventsList(size, viewModel.pastEvents, viewModel),
                              ],
                            ),
                          ),
                        ],
                      ),
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

  Widget _buildHeader(BuildContext context, Size size) {
    return Container(
      padding: EdgeInsets.all(size.width * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

          // Title
          Text(
            'Événements',
            style: TextStyle(
              fontSize: size.width * 0.06,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          // Empty space for symmetry
          SizedBox(width: 48),
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
            Icons.event_busy_outlined,
            size: size.width * 0.3,
            color: Colors.white.withOpacity(0.5),
          ),
          SizedBox(height: size.height * 0.02),
          Text(
            'Aucun événement',
            style: TextStyle(
              fontSize: size.width * 0.05,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Text(
            'Aucun événement n\'est disponible pour le moment',
            style: TextStyle(
              fontSize: size.width * 0.035,
              color: Colors.white.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildEventsList(Size size, List<Event> events, EventViewModel viewModel) {
    if (events.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_note_outlined,
              size: size.width * 0.2,
              color: Colors.white.withOpacity(0.5),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              'Aucun événement dans cette catégorie',
              style: TextStyle(
                fontSize: size.width * 0.04,
                color: Colors.white.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      itemCount: events.length,
      itemBuilder: (context, index) {
        Event event = events[index];
        return _buildEventCard(context, size, event);
      },
    );
  }

  Widget _buildEventCard(BuildContext context, Size size, Event event) {
    final dateFormat = DateFormat('dd MMM yyyy', 'fr_FR');
    final timeFormat = DateFormat('HH:mm');

    return GestureDetector(
      onTap: () {
        Get.to(
          () => EventDetailScreen(event: event),
          transition: Transition.rightToLeft,
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: size.height * 0.02),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 15,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Image
            Stack(
              children: [
                Hero(
                  tag: 'event_${event.id}',
                  child: Container(
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      child: Image.network(
                        event.imageUrl,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: Center(
                              child: Icon(
                                Icons.image_not_supported,
                                size: 60,
                                color: Colors.grey[600],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                // Status Badge
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: _getStatusColor(event),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      event.status,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Days Until Badge (for upcoming events)
                if (event.isUpcoming)
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        event.daysUntilStart,
                        style: TextStyle(
                          color: AppColors.GreeFonce,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            // Event Details
            Padding(
              padding: EdgeInsets.all(size.width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    event.title,
                    style: TextStyle(
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blue,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: size.height * 0.01),

                  // Date
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: size.width * 0.04,
                        color: AppColors.GreeMedium,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '${dateFormat.format(event.startDate)} • ${timeFormat.format(event.startDate)}',
                          style: TextStyle(
                            fontSize: size.width * 0.035,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.008),

                  // Location
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: size.width * 0.04,
                        color: AppColors.GreeMedium,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          event.location,
                          style: TextStyle(
                            fontSize: size.width * 0.035,
                            color: Colors.grey[700],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.008),

                  // Category
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03,
                      vertical: size.height * 0.005,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.GreeMedium.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      event.category,
                      style: TextStyle(
                        fontSize: size.width * 0.032,
                        color: AppColors.GreeFonce,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(Event event) {
    if (event.isOngoing) return Colors.green;
    if (event.isUpcoming) return Colors.blue;
    return Colors.grey;
  }
}

