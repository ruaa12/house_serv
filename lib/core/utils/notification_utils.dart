import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:home_serviece/core/utils/shared_preferece_noti.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const InitializationSettings initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );

    _notificationsPlugin.initialize(initializationSettings, );
  }

  static void display(RemoteMessage message) async {
    try {
      print(message);
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "test",
          "test channel",
          channelDescription: "this is our channel",
          importance: Importance.max,
          playSound: true,
          priority: Priority.max,
        ),
        iOS: DarwinNotificationDetails(),
      );
      await _notificationsPlugin.show(
        id,
        // message.notification!.title,
        // message.notification!.body,
        message.data["title"],
        message.data["body"],
        notificationDetails,
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  /// Initialize Firebase and set up message handlers
  Future<void> initialize() async {
    // Initialize Firebase
    await Firebase.initializeApp();

    // Request notification permissions for iOS
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Set foreground notification presentation options for iOS
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Receiv');
      print('Message data: meed a message while in the');
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        LocalNotificationService.display(message);
      }
    });

    // Handle messages that are opened from a notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message clicked!');
    });

    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Print the token each time the application loads
    String token = await getToken();
    SharedPreferencesService.storeFcmToken(token);
    print("Firebase Messaging Token: $token");
  }

  /// This handler must be a top-level function
  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    print("Handling a background message: ${message.messageId}");
  }

  /// Get the FCM token for this device
  Future<String> getToken() async {
    String token = await _firebaseMessaging.getToken() ?? "";
    SharedPreferencesService.storeFcmToken(token);
    return token;
  }
}

