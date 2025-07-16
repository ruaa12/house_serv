import 'package:flutter/material.dart';
import 'package:home_serviece/core/utils/logout_helper.dart';
import 'package:home_serviece/feature/address/presentation/address_screen.dart';
import 'package:home_serviece/feature/home/presentation/screen/edit_profile.dart';
import 'package:home_serviece/feature/home/presentation/screen/editpassword.dart';
import 'package:home_serviece/feature/home/presentation/screen/navbar.dart';
import 'package:home_serviece/feature/home/presentation/screen/setting.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:home_serviece/feature/home/presentation/widget/customlsttile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:home_serviece/feature/home/presentation/screen/my_profile.dart';
import 'package:home_serviece/generated/locale_keys.g.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static String id = 'My profile';

  @override
  State<ProfileScreen> createState() => _ProScreenState();
}

class _ProScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color1,
        appBar: AppBar(
          title: Text('profile'.tr()),
          leading: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Navbar(),
                      ));
                },
                icon: Icon(Icons.arrow_back),
              )
            ],
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 120, left: 16, right: 16),
            child: ListView(children: [
              Column(children: [
                CustomListTile(
                  title: LocaleKeys.myProfile_My_prof.tr(),
                  leading: Image.asset('assets/images/Rectangle 2113.png'),
                  trailing:
                      const Icon(Icons.edit, color: Colors.black, size: 24),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyProfileScreen(),
                        ));
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomListTile(
                  title: LocaleKeys.editProfile_Edit_prof.tr(),
                  leading: Image.asset('assets/images/Rectangle 2113.png'),
                  trailing:
                      const Icon(Icons.edit, color: Colors.black, size: 24),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfile(),
                        ));
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomListTile(
                  title: LocaleKeys.editpassword_Edit_password.tr(),
                  leading: Image.asset('assets/images/Rectangle 2113.png'),
                  trailing:
                      const Icon(Icons.edit, color: Colors.black, size: 24),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditpasswordScreen(),
                        ));
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomListTile(
                  title: LocaleKeys.profile_Setting.tr(),
                  leading: Image.asset('assets/images/Rectangle 2113 (3).png'),
                  trailing: const Icon(Icons.chevron_right,
                      color: Colors.black, size: 24),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsScreen(),
                        ));
                  },
                ),
                const SizedBox(height: 15),
                CustomListTile(
                  title: LocaleKeys.profile_addresses.tr(),
                  leading: Image.asset(
                    'assets/images/address-icon-15.png',
                    width: 24,
                    height: 24,
                  ),
                  trailing: const Icon(Icons.chevron_right,
                      color: Colors.black, size: 24),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddressScreen(),
                        ));
                  },
                ),
                const SizedBox(height: 15),
                CustomListTile(
                  title: LocaleKeys.profile_Log_out.tr().tr(),
                  leading: Image.asset('assets/images/Rectangle 2113 (5).png'),
                  trailing: const Icon(Icons.chevron_right,
                      color: Colors.black, size: 24),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Confirm Logout'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Are you sure you want to log out?'.tr()),
                              SizedBox(height: 20),
                              Image.asset('assets/images/image 52.png'),
                            ],
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 50.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          backgroundColor: color4,
                          actions: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(260, 40),
                                    backgroundColor: color1,
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop(); // إلغاء
                                  },
                                  child: Text('Cancel'.tr()),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(260, 40),
                                    backgroundColor: color1,
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    performLogout(
                                        context); // تنفيذ تسجيل الخروج
                                  },
                                  child: Text('Log out'.tr()),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ])
            ])));
  }
}
