import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nafsia/core/models/notification_model.dart';
import 'package:nafsia/core/utils/constants.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationModalSheet extends StatelessWidget {
  const NotificationModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('ar', timeago.ArMessages());
    final box = Hive.box<NotificationModel>(kNotificationsBox);

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      padding: const EdgeInsets.all(16),
      child: ValueListenableBuilder(
        valueListenable: box.listenable(),
       builder: (context, Box<NotificationModel> box, _) {
  if (box.isEmpty) {
    return const Center(
      child: Text(
        "لا يوجد إشعارات حالياً",
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  final reversedNotifications = box.values.toList().reversed.toList();

  return ListView.separated(
    itemCount: reversedNotifications.length,
    separatorBuilder: (_, __) => const Divider(),
    itemBuilder: (context, index) {
      final notification = reversedNotifications[index];
      return Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {
                // 🗑️ Delete by key instead of index
                final keyToDelete = box.keyAt(box.values.toList().indexOf(notification));
                box.delete(keyToDelete);
              },
              backgroundColor: Colors.red,
              icon: Icons.delete,
              label: 'حذف',
            ),
          ],
        ),
        child: ListTile(
          title: Text(notification.title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(notification.body),
          trailing: Text(
            timeago.format(notification.timestamp, locale: 'ar'),
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        ),
      );
    },
  );
},
      ),
    );
  }
}