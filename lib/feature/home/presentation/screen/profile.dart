import 'package:flutter/material.dart';
import 'package:home_serviece/feature/home/presentation/screen/edit_profile.dart';
import 'package:home_serviece/feature/home/presentation/screen/Logout.dart';
import 'package:home_serviece/feature/home/presentation/screen/support.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:home_serviece/feature/home/presentation/widget/customlsttile.dart';

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
          backgroundColor: Colors.white,
          title: const Text('My profile'),
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 180, left: 16, right: 16),
            child: Column(children: [
              CustomListTile(
                title: 'Edit Profile',
                leading: Image.asset('images/Rectangle 2113.png'),
                trailing: const Icon(Icons.edit, color: Colors.black, size: 24),
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
                title: 'Edit password',
                leading: Image.asset('images/Rectangle 2113.png'),
                trailing: const Icon(Icons.edit, color: Colors.black, size: 24),
                onTap: () {},
              ),
              const SizedBox(height: 15),
              CustomListTile(
                title: 'Help & Support',
                leading: Image.asset('images/Rectangle 2113 (3).png'),
                trailing: const Icon(Icons.chevron_right,
                    color: Colors.black, size: 24),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SupportScreen(),
                      ));
                },
              ),
              const SizedBox(height: 15),
              CustomListTile(
                title: '   Log out',
                leading: Image.asset('images/Rectangle 2113 (2).png'),
                trailing: const Icon(Icons.chevron_right,
                    color: Colors.black, size: 24),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LogoutScreen(),
                      ));
                },
              )
            ]
            )   
    )
    );
  }
}
