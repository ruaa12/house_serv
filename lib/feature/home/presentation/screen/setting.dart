import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/feature/home/bloc/cubit/settings_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // تغيير اللغة
                Text('Change Language',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  value: state.selectedLanguage,
                  items: ['English', 'Arabic']
                      .map((lang) => DropdownMenuItem(
                            value: lang,
                            child: Text(lang),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      context.read<SettingsCubit>().changeLanguage(value);
                    }
                  },
                ),
                Divider(),

                Text('Appearance Settings',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SwitchListTile(
                  title: Text('Dark Mode'),
                  value: state.isDarkModeEnabled, 
                  onChanged: (value) {
                    context.read<SettingsCubit>().toggleDarkMode();
                                    },
                ),
                Divider(),

               
                Text('Notification Settings',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SwitchListTile(
                  title: Text('Enable Notifications'),
                  value: state.isNotificationsEnabled, // معالجة null باستخدام قيمة افتراضية
                  onChanged: (value) {
                    context.read<SettingsCubit>().toggleNotifications();
                                    },
                ),
                Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}
