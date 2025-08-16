import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../feature/home/presentation/widget/const.dart';
import '../data/model/notification_model.dart';
import '../data/repo/notification_repository.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late NotificationRepository notificationRepository;
  List<NotificationModel> notifications = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    notificationRepository = NotificationRepository(prefs);

    final savedNotifications = await notificationRepository.getSavedNotifications();

    setState(() {
      notifications = savedNotifications;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color6,
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text(
          'الإشعارات',
          style: TextStyle(
            color: color6,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: color6),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: color1))
          : notifications.isEmpty
              ? const Center(
                  child: Text(
                    'لا يوجد إشعارات محفوظة',
                    style: TextStyle(fontSize: 18, color: color5),
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final notification = notifications[index];
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: color4,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: color3.withOpacity(0.3)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notification.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: color1,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            notification.body,
                            style: const TextStyle(
                              fontSize: 16,
                              color: color5,
                            ),
                          ),
                          const SizedBox(height: 8),
                           Text(
                        _formatDate(notification.date),
                        style: TextStyle(
                          color: color3, // أزرق متوسط
                          fontSize: 12,
                        ),
                      ),
                        ],
                      ),
                    );
                  },
                ),
    );
    
  }
  String _formatDate(DateTime date) {
    return "${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')} - ${date.hour}:${date.minute.toString().padLeft(2, '0')}";
  }
}
