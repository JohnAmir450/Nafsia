import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:nafsia/core/models/notification_model.dart';
import 'package:nafsia/core/utils/constants.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class NotificationService {
  String url = 'https://api.onesignal.com/notifications';
  static const String oneSignalAppId = kOneSignalAppId;
  static const String oneSignalRestApiKey =
      "os_v2_app_ravfrq2ty5aozezpjwmh5yh6y6yyyiuyauzupl5fovezdflxup2nj4tf5z7imo2agkcuqebfyu22uljnt3zgct5ydjieepighj7urga";

  Future<void> sendNotification(
      {String? receiverId, required String title, required String body}) async {
    try {
      var pushId = OneSignal.User.pushSubscription.id.toString();
      var response = await http.post(
          Uri.parse(
            url,
          ),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Basic $oneSignalRestApiKey'
          },
          body: jsonEncode({
            "app_id": oneSignalAppId,
            "contents": {"en": body},
            "include_player_ids": [receiverId ?? pushId],
            "headings": {"en": title},
          }));

      if (response.statusCode == 200) {
        print("notification sent ");
      } else {}
    } on Exception catch (e) {
      print("notification failed $e");
    }
  }

  void saveNotificationLocally(String title, String body) {
    final box = Hive.box<NotificationModel>(kNotificationsBox);
    final notification = NotificationModel(
      title: title,
      body: body,
      timestamp: DateTime.now(),
    );
    box.add(notification);
    print("📦 Notification saved locally.");
  }

  void setupNotificationListeners() {
    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      final title = event.notification.title ?? '';
      final body = event.notification.body ?? '';
      saveNotificationLocally(title, body);
    });

    OneSignal.Notifications.addClickListener((event) {
      final title = event.notification.title ?? '';
      final body = event.notification.body ?? '';
      saveNotificationLocally(title, body);
    });
  }
}
