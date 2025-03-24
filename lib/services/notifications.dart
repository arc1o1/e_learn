import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  final notificationsPlugin = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false; // Corrected initialization state
  bool get isInitialized => _isInitialized;

  // Initialization
  Future<void> initNotification() async {
    if (_isInitialized) return;

    const initSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const initSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: initSettingsAndroid,
      iOS: initSettingsIOS,
    );

    await notificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        debugPrint('Notification Clicked: ${response.payload}');
      },
    );

    final AndroidNotificationChannel channel = AndroidNotificationChannel(
      'elearn_daily', // Consistent Channel ID
      'Daily Notifications',
      description: 'This channel is used for daily notifications.',
      importance: Importance.high,
    );

    await notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    _isInitialized = true;
  }

  // Notification details
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'elearn_daily',
        'Daily Notifications',
        channelDescription: 'Daily Notification Channel',
        importance: Importance.max,
        priority: Priority.high,
        playSound: true, // Ensure sound plays
      ),
      iOS: DarwinNotificationDetails(presentSound: true),
    );
  }

  // Show notifications
  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async {
    return notificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails(), // Use correct notification details
    );
  }
}

// implementaion
// ElevatedButton(
//             onPressed: () => NotificationServices().showNotification(
//               title: "eLearn Daily Notifications",
//               body: "Welcome back to your all in one platform in studies",
//             ),
//             style: ElevatedButton.styleFrom(
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             ),
//             child: Text("Show Notification"),
//           ),
