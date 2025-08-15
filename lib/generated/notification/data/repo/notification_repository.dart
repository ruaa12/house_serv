import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/notification_model.dart';

class NotificationRepository {
  final SharedPreferences? sharedPreferences;
  final String key = 'cached_notifications';

  NotificationRepository(this.sharedPreferences  );

  Future<void> saveNotification(NotificationModel notification) async {
    final oldData = await getSavedNotifications();
    oldData.insert(0, notification);  // أحدث إشعار أولاً
    final jsonList = oldData.map((n) => n.toJson()).toList();
    final encoded = jsonEncode(jsonList);
    await sharedPreferences!.setString(key, encoded);
  }

  Future<List<NotificationModel>> getSavedNotifications() async {
    final jsonString = sharedPreferences!.getString(key);

    if (jsonString != null) {
      final List decoded = jsonDecode(jsonString);
      return decoded.map((e) => NotificationModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
