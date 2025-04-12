import 'package:flutter/material.dart';
import 'package:home_serviece/feature/home/presentation/screen/edit_profile.dart';
import 'package:home_serviece/feature/home/presentation/screen/editpassword.dart';
import 'package:home_serviece/feature/home/presentation/screen/profile.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:home_serviece/feature/auth/presentation/widget/button.dart';
import 'package:home_serviece/feature/home/presentation/widget/customlsttile.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkModeEnabled = false;
  bool isNotificationsEnabled = true;
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: color1,
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    ));
              },
              icon: Icon(Icons.arrow_back),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Change Language',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: selectedLanguage,
                items: ['English', 'Arabic']
                    .map((lang) => DropdownMenuItem(
                          value: lang,
                          child: Text(lang),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value!;
                  });
                },
                hint: Text('Select Language'),
                isExpanded: true,
                dropdownColor: Colors.white,
              ),
              Divider(),
              Text(
                'Appearance Settings',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              CustomListTile(
                title: 'Dark Mode',
                leading: Icon(Icons.nightlight_round, color: color1),
                trailing: Switch(
                  activeColor: color1,
                  value: isDarkModeEnabled,
                  onChanged: (value) {
                    setState(() {
                      isDarkModeEnabled = value;
                    });
                  },
                ),
                onTap: () {
                  setState(() {
                    isDarkModeEnabled = !isDarkModeEnabled;
                  });
                },
              ),
              Divider(),
              Text(
                'Account Settings',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              CustomListTile(
                title: 'Change Name',
                leading: Icon(Icons.person, color: color1),
                trailing: Icon(Icons.arrow_forward, color: color1),
                onTap: () {
                  // فتح واجهة تعديل الاسم
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfile(),
                    ),
                  );
                },
              ),
              CustomListTile(
                title: 'Change Password',
                leading: Icon(Icons.lock, color: color1),
                trailing: Icon(Icons.arrow_forward, color: Colors.grey),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditpasswordScreen(),
                    ),
                  );
                },
              ),
              Divider(),
              Text(
                'Notification Settings',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              CustomListTile(
                title: 'Enable Notifications',
                leading: Icon(Icons.notifications, color: color1),
                trailing: Switch(
                  activeColor: color1,
                  value: isNotificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      isNotificationsEnabled = value;
                    });
                  },
                ),
                onTap: () {
                  setState(() {
                    isNotificationsEnabled = !isNotificationsEnabled;
                  });
                },
              ),
              Divider(),
              SizedBox(height: 20),
              Center(
                child: Button(
                  name: 'Save Settings',
                  ontap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Settings Saved'),
                        content: Text(
                          'Your settings have been updated successfully.\n\n'
                          'Language: $selectedLanguage\n'
                          'Dark Mode: ${isDarkModeEnabled ? "Enabled" : "Disabled"}\n'
                          'Notifications: ${isNotificationsEnabled ? "Enabled" : "Disabled"}',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
