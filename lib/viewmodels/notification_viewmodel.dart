import 'package:flelobna/data/repositories/notification_repository.dart';
import 'package:flelobna/models/notification_model.dart';
import 'package:get/get.dart';

/// ViewModel for Notifications
class NotificationViewModel extends GetxController {
  final NotificationRepository _repository = NotificationRepository();

  // Observable state
  final RxList<AppNotification> notifications = <AppNotification>[].obs;
  final RxInt unreadCount = 0.obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadNotifications();
  }

  /// Load notifications from repository
  void _loadNotifications() {
    _repository.getNotificationsStream().listen(
      (notificationsList) {
        notifications.value = notificationsList;
        _updateUnreadCount();
      },
      onError: (error) {
        print('Error loading notifications: $error');
      },
    );
  }

  /// Update unread count
  void _updateUnreadCount() {
    unreadCount.value = notifications.where((n) => !n.isRead).length;
  }

  /// Get unread notifications
  List<AppNotification> get unreadNotifications => 
      notifications.where((n) => !n.isRead).toList();

  /// Get read notifications
  List<AppNotification> get readNotifications => 
      notifications.where((n) => n.isRead).toList();

  /// Mark notification as read
  Future<void> markAsRead(String notificationId) async {
    try {
      await _repository.markAsRead(notificationId);
    } catch (e) {
      print('Error marking notification as read: $e');
    }
  }

  /// Mark all notifications as read
  Future<void> markAllAsRead() async {
    try {
      isLoading.value = true;
      await _repository.markAllAsRead();
      Get.snackbar(
        'Succès',
        'Toutes les notifications ont été marquées comme lues',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Erreur',
        'Impossible de marquer les notifications comme lues',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Delete notification
  Future<void> deleteNotification(String notificationId) async {
    try {
      await _repository.deleteNotification(notificationId);
      Get.snackbar(
        'Succès',
        'Notification supprimée',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Erreur',
        'Impossible de supprimer la notification',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /// Refresh notifications
  Future<void> refreshNotifications() async {
    // The stream will automatically update
    await Future.delayed(Duration(milliseconds: 500));
  }
}

