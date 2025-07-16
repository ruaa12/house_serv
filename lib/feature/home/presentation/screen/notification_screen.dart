import 'package:flutter/material.dart';
import 'package:home_serviece/feature/home/presentation/screen/home_screen.dart';
import 'package:home_serviece/feature/home/presentation/screen/profile.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:home_serviece/feature/home/presentation/widget/customlsttile.dart';

class NotificationsScreen extends StatelessWidget {
  final List<String> notifications = [
    'You have a new offer with 20% discount!',
    'Your app has been updated successfully.',
    'Reminder: Meeting scheduled for 3 PM today.',
  ];

  NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: color1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                )); // العودة إلى الشاشة السابقة
          },
        ),
      ),
      body: notifications.isEmpty
          ? Center(
              child: Text(
                'No notifications available.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: CustomListTile(
                    title: notifications[index],
                    leading: Icon(
                      Icons.notifications,
                      color: color1,
                    ),
                    trailing: null, // لا حاجة لعنصر في الجانب الأيمن
                    onTap: () {
                      // عند الضغط على الإشعار
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Notification Details'),
                          content: Text(notifications[index]),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
