import 'package:flelobna/constants/app_colors.dart';
import 'package:flelobna/models/notification_model.dart';
import 'package:flelobna/viewmodels/notification_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NotificationViewModel viewModel = Get.put(NotificationViewModel());
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
              _buildHeader(context, size, viewModel),
              
              // Notifications List
              Expanded(
                child: Obx(() {
                  if (viewModel.isLoading.value && viewModel.notifications.isEmpty) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    );
                  }

                  if (viewModel.notifications.isEmpty) {
                    return _buildEmptyState(size);
                  }

                  return RefreshIndicator(
                    onRefresh: viewModel.refreshNotifications,
                    color: AppColors.GreeFonce,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(size.width * 0.04),
                      itemCount: viewModel.notifications.length,
                      itemBuilder: (context, index) {
                        AppNotification notification = viewModel.notifications[index];
                        return _buildNotificationCard(
                          context,
                          size,
                          notification,
                          viewModel,
                        );
                      },
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

  Widget _buildHeader(BuildContext context, Size size, NotificationViewModel viewModel) {
    return Container(
      padding: EdgeInsets.all(size.width * 0.04),
      child: Column(
        children: [
          Row(
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
                'Notifications',
                style: TextStyle(
                  fontSize: size.width * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              // Mark All as Read Button
              Obx(() => GestureDetector(
                onTap: viewModel.unreadCount.value > 0
                    ? () => viewModel.markAllAsRead()
                    : null,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: viewModel.unreadCount.value > 0
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
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
                    Icons.done_all,
                    color: AppColors.GreeFonce,
                  ),
                ),
              )),
            ],
          ),

          SizedBox(height: size.height * 0.02),

          // Unread Count
          Obx(() => viewModel.unreadCount.value > 0
              ? Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.04,
                    vertical: size.height * 0.01,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${viewModel.unreadCount.value} notification(s) non lue(s)',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.035,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              : SizedBox.shrink()),
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
            Icons.notifications_off_outlined,
            size: size.width * 0.3,
            color: Colors.white.withOpacity(0.5),
          ),
          SizedBox(height: size.height * 0.02),
          Text(
            'Aucune notification',
            style: TextStyle(
              fontSize: size.width * 0.05,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Text(
            'Vous n\'avez pas encore de notifications',
            style: TextStyle(
              fontSize: size.width * 0.035,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard(
    BuildContext context,
    Size size,
    AppNotification notification,
    NotificationViewModel viewModel,
  ) {
    final dateFormat = DateFormat('dd MMM yyyy • HH:mm', 'fr_FR');

    return Dismissible(
      key: Key(notification.id ?? notification.timestamp.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: EdgeInsets.only(bottom: size.height * 0.015),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: size.width * 0.05),
        child: Icon(
          Icons.delete_outline,
          color: Colors.white,
          size: 32,
        ),
      ),
      onDismissed: (direction) {
        if (notification.id != null) {
          viewModel.deleteNotification(notification.id!);
        }
      },
      child: GestureDetector(
        onTap: () {
          if (!notification.isRead && notification.id != null) {
            viewModel.markAsRead(notification.id!);
          }
        },
        child: Container(
          margin: EdgeInsets.only(bottom: size.height * 0.015),
          decoration: BoxDecoration(
            color: notification.isRead 
                ? Colors.white.withOpacity(0.9)
                : Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
            border: notification.isRead
                ? null
                : Border.all(
                    color: AppColors.GreeMedium.withOpacity(0.5),
                    width: 2,
                  ),
          ),
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.04),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon
                Container(
                  width: size.width * 0.12,
                  height: size.width * 0.12,
                  decoration: BoxDecoration(
                    color: _getNotificationColor(notification.type),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      notification.iconEmoji,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),

                SizedBox(width: size.width * 0.03),

                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Type Badge
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.02,
                              vertical: size.height * 0.003,
                            ),
                            decoration: BoxDecoration(
                              color: _getNotificationColor(notification.type),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              notification.typeLabel,
                              style: TextStyle(
                                fontSize: size.width * 0.028,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          // Unread Indicator
                          if (!notification.isRead)
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: AppColors.GreeFonce,
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),

                      SizedBox(height: size.height * 0.008),

                      // Title
                      Text(
                        notification.title,
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blue,
                        ),
                      ),

                      SizedBox(height: size.height * 0.005),

                      // Body
                      Text(
                        notification.body,
                        style: TextStyle(
                          fontSize: size.width * 0.035,
                          color: Colors.grey[700],
                          height: 1.3,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),

                      SizedBox(height: size.height * 0.008),

                      // Timestamp
                      Text(
                        dateFormat.format(notification.timestamp),
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getNotificationColor(String type) {
    switch (type) {
      case 'new_course':
        return Colors.blue.shade400;
      case 'new_video':
        return Colors.purple.shade400;
      case 'new_event':
        return Colors.green.shade400;
      default:
        return Colors.grey.shade400;
    }
  }
}

