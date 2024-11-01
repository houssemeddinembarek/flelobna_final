import 'package:firebase_messaging/firebase_messaging.dart';

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseApi {
  // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  // FlutterLocalNotificationsPlugin();

  final _firebaseMessaging = FirebaseMessaging.instance;

  // final _androidChannel = const AndroidNotificationChannel(
  //     'hight_importance_channel', 'High Importance Notification',
  //     description: 'this is a channel used for important notification',
  //     importance: Importance.defaultImportance);
  // static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  //  Future<void> initNotification() async {
  //   await _firebaseMessaging.requestPermission();
  //   final fCMToken = await _firebaseMessaging.getToken();
  //   // driverController.fcmToken.value = fCMToken.toString();
  //
  //   print('============================');
  //   print('Token: $fCMToken');
  //   print('============================');
  //
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     print("Message received: ${message.notification?.body}");
  //
  //     final AndroidNotificationDetails androidNotificationDetails =
  //     AndroidNotificationDetails(
  //       'channel',
  //       'Notification Name',
  //       // 'Channel Description', // Replace with your channel description
  //       importance: Importance.high,
  //       priority: Priority.high,
  //     );
  //
  //     final NotificationDetails platformChannelSpecifics = NotificationDetails(
  //       android: androidNotificationDetails,
  //       // iOS: initializationSettingsIOS,
  //     );
  //
  //     FlutterLocalNotificationsPlugin().show(
  //       0, // Notification ID
  //       message.notification?.title,
  //       message.notification?.body,
  //       platformChannelSpecifics,
  //       payload: 'customData',
  //     );
  //   });
  //
  //   // Future<void> _handleBackgroundMessage(RemoteMessage message) async {
  //   //   // Your background message handling logic here
  //   // }
  //   // FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
  // }

  // Future<void> _handleBackgroundMessage(RemoteMessage message) async {
  //   print('Handling a background message: ${message.messageId}');
  //
  //   // Process the message contents as needed
  //   final notificationTitle = message.notification?.title;
  //   final notificationBody = message.notification?.body;
  //
  //   if (notificationTitle != null && notificationBody != null) {
  //     // Show a local notification with the message contents
  //     final AndroidNotificationDetails androidNotificationDetails =
  //     AndroidNotificationDetails(
  //       'channel_notification', // Replace with your notification channel ID
  //       'Notification Name', // Replace with your channel name
  //       importance: Importance.high,
  //       priority: Priority.high,
  //     );
  //
  //     final NotificationDetails platformChannelSpecifics = NotificationDetails(
  //       android: androidNotificationDetails,
  //     );
  //
  //     await FlutterLocalNotificationsPlugin().show(
  //       0, // Notification ID
  //       notificationTitle, // Notification Title
  //       notificationBody, // Notification Body
  //       platformChannelSpecifics,
  //       payload: 'customData',
  //     );
  //   }
  // }
  //

  Future<void> _handleBackgroundMessage(RemoteMessage message) async {
    print('__________________________________________________');
    print('__________________________________________________');
    print('__________________________________________________');
    print('__________________________________________________');
    print("Handling a background message: ${message.messageId}");
    print('__________________________________________________');
    print('__________________________________________________');
    print('__________________________________________________');
    print('__________________________________________________');
    print('__________________________________________________');

    // final AndroidNotificationDetails androidNotificationDetails =
    // AndroidNotificationDetails(
    //   'notification', // Replace with the appropriate channel_id
    //   'notification Name', // Replace with your channel name
    //   // 'Channel Description', // Replace with your channel description
    //   importance: Importance.high,
    //   priority: Priority.high,
    // );

    // final NotificationDetails platformChannelSpecifics = NotificationDetails(
    //   android: androidNotificationDetails,
    //   // iOS: iosNotificationDetails
    // );

    //   await flutterLocalNotificationsPlugin.show(
    //     0, // Notification ID
    //     message.notification?.title, // Notification Title
    //     message.notification?.body, // Notification Body
    //     platformChannelSpecifics,
    //     payload: 'customData',
    //   );
    // }

    // static Future<NotificationDetails> _notificationDetails() async {
    //   final AndroidNotificationDetails androidPlatformChannelSpecifics =
    //   AndroidNotificationDetails(
    //     'channel id',
    //     'channel name',
    //     channelDescription: 'channel description',
    //     importance: Importance.max,
    //   );

    // const DarwinNotificationDetails iOSPlatformChannelSpecifics =
    // DarwinNotificationDetails();
    //
    // return NotificationDetails(
    //   android: androidPlatformChannelSpecifics,
    //   iOS: iOSPlatformChannelSpecifics,
    // );
  }

// static Future init({bool initScheduled = false}) async {
//   final android = AndroidInitializationSettings('@mipmap/ic_launcher');
//   final iOS = DarwinInitializationSettings();
//   final settings = InitializationSettings(android: android, iOS: iOS);
//   await _notifications.initialize(
//     settings,
//     onDidReceiveNotificationResponse: (payload) async {
//       onNotifications.add(payload.toString());
//     },
//   );
// }

// static Future<void> showNotification() async {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//   const AndroidNotificationDetails androidPlatformChannelSpecifics =
//   AndroidNotificationDetails(
//     'sadfa', // ID for the notification channel
//     'namamamamamama', // Name for the notification channel
//     // 'your_channel_description', // Description for the notification channel
//     importance: Importance.max,
//     priority: Priority.high,
//     showWhen: false,
//   );

// const NotificationDetails platformChannelSpecifics =
// NotificationDetails(android: androidPlatformChannelSpecifics);

// await flutterLocalNotificationsPlugin.show(
//   0, // Notification ID
//   'From Admin',
//   'Test from ADMIN',
//   platformChannelSpecifics,
// );
// }
}
