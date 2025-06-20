import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/feature/home/bloc/cubit/settings_cubit.dart';
import 'package:home_serviece/feature/home/bloc/cubit/settings_state.dart';
import 'package:home_serviece/feature/home/presentation/screen/edit_profile.dart';
import 'package:home_serviece/feature/home/presentation/screen/editpassword.dart';
import 'package:home_serviece/feature/home/presentation/screen/my_profile.dart';
import 'package:home_serviece/feature/home/presentation/screen/profile.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:home_serviece/feature/auth/presentation/widget/button.dart';
import 'package:home_serviece/feature/home/presentation/widget/customlsttile.dart';
import 'package:home_serviece/generated/locale_keys.g.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.profile_Setting.tr()),
        backgroundColor: color1,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // اللغة
                Text(
                  LocaleKeys.setting_Change_lang.tr(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                DropdownButton<String>(
                  value: state.selectedLanguage == 'en' ? 'English' : 'Arabic',
                  items: ['English', 'Arabic']
                      .map((lang) => DropdownMenuItem(
                            value: lang,
                            child: Text(lang),
                          ))
                      .toList(),
                  onChanged: (value) async {
                    final langCode = value == 'English' ? 'en' : 'ar';
                    await context.setLocale(Locale(langCode));
                    context.read<SettingsCubit>().setLanguage(langCode);
                  },
                  isExpanded: true,
                  dropdownColor: Colors.white,
                ),
                Divider(),

                // الوضع المظلم
                Text(
                  LocaleKeys.setting_Appearance_Setting.tr(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                CustomListTile(
                  title: LocaleKeys.setting_Dark_Mood.tr().tr(),
                  leading: Icon(Icons.nightlight_round, color: color1),
                  trailing: Switch(
                    activeColor: color1,
                    value: state.isDarkModeEnabled,
                    onChanged: (value) {
                      context.read<SettingsCubit>().toggleDarkMode();
                    },
                  ),
                  onTap: () {
                    context.read<SettingsCubit>().toggleDarkMode();
                  },
                ),
                Divider(),

                // الإعدادات الحسابية
                Text(
                  'Account Settings'.tr(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                CustomListTile(
                  title: 'Change Name'.tr(),
                  leading: Icon(Icons.person, color: color1),
                  trailing: Icon(Icons.arrow_forward, color: color1),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                ),
                CustomListTile(
                  title: 'Change Password'.tr(),
                  leading: Icon(Icons.lock, color: color1),
                  trailing: Icon(Icons.arrow_forward, color: Colors.grey),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditpasswordScreen()),
                    );
                  },
                ),
                Divider(),

                // الإشعارات
                Text(
                  'Notification Settings'.tr(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                CustomListTile(
                  title: 'Enable Notifications'.tr(),
                  leading: Icon(Icons.notifications, color: color1),
                  trailing: Switch(
                    activeColor: color1,
                    value: state.isNotificationsEnabled,
                    onChanged: (value) {
                      context.read<SettingsCubit>().toggleNotifications();
                    },
                  ),
                  onTap: () {
                    context.read<SettingsCubit>().toggleNotifications();
                  },
                ),
                Divider(),

                // زر الحفظ
                SizedBox(height: 20),
                Center(
                  child: Button(
                    name: 'Save Settings'.tr(),
                    ontap: () {
                      final lang =
                          state.selectedLanguage == 'en' ? 'English' : 'Arabic';
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Settings Saved'.tr()),
                          content: Text(
                              'Your settings have been updated successfully.\n\n'
                                      'Language: $lang\n'
                                      'Dark Mode: ${state.isDarkModeEnabled ? "Enabled" : "Disabled"}\n'
                                      'Notifications: ${state.isNotificationsEnabled ? "Enabled" : "Disabled"}'
                                  .tr()),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('OK'.tr()),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
