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

          return ListView.separated(
            itemCount: box.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final notification = box.getAt(index);
              if (notification == null) return const SizedBox.shrink();

              return Slidable(
                endActionPane: ActionPane(
                  motion: const StretchMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (_) => box.deleteAt(index),
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
                    timeago.format(notification.timestamp,locale: 'ar'),
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