import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:home_serviece/feature/auth/presentation/screen/iam_looking_for.dart';
import 'package:home_serviece/feature/auth/presentation/screen/login_screen.dart';
import 'package:home_serviece/feature/auth/presentation/screen/signup_user.dart';
import 'package:home_serviece/feature/auth/presentation/screen/signup_worker.dart';

import 'package:home_serviece/feature/home/presentation/screen/edit_profile.dart';
import 'package:home_serviece/feature/home/presentation/screen/home_screen.dart';
import 'package:home_serviece/feature/home/presentation/screen/houses_screen.dart';
import 'package:home_serviece/feature/home/presentation/screen/navbar.dart';
import 'package:home_serviece/feature/home/presentation/screen/profile.dart';
import 'package:home_serviece/feature/home/presentation/screen/services_screen.dart';
import 'package:home_serviece/feature/home/presentation/screen/support.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:home_serviece/feature/onbording/pages/onbording_screen.dart';
import 'package:home_serviece/feature/onbording/pages/splash_screen.dart';

void main() {
  runApp(const DreamHouse());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        scaffoldBackgroundColor: color4,
      ),
      // home:  ProfileScreen(),
    );
  }
}

class DreamHouse extends StatelessWidget {
  const DreamHouse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        IamLookingFor.id: (context) => const IamLookingFor(),
        LoginScreen.id: (context) => LoginScreen(),
        SignupUser.id: (context) => SignupUser(),
        SignupWorker.id: (context) => SignupWorker(),
        EditProfile.id: (context) => EditProfile(),
        HomeScreen.id: (context) => const HomeScreen(),
        HousesScreen.id: (context) => const HousesScreen(),
        ProfileScreen.id: (context) => const ProfileScreen(),
        ServicesScreen.id: (context) => const ServicesScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}