import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// المكتبة المطلوبة للحصول على دليل التخزين

import 'package:home_serviece/feature/auth/presentation/screen/iam_looking_for.dart';
import 'package:home_serviece/feature/auth/presentation/screen/login_screen.dart';
import 'package:home_serviece/feature/auth/presentation/screen/signup_user.dart';
import 'package:home_serviece/feature/auth/presentation/screen/signup_worker.dart';
import 'package:home_serviece/feature/home/presentation/screen/edit_profile.dart';
import 'package:home_serviece/feature/home/presentation/screen/home_screen.dart';
import 'package:home_serviece/feature/home/presentation/screen/houses_screen.dart';

import 'package:home_serviece/feature/home/presentation/screen/profile.dart';
import 'package:home_serviece/feature/home/presentation/screen/services_screen.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:home_serviece/feature/home/bloc/cubit/settings_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  /*inal storage = await HydratedStorage.build();
  HydratedBloc.storage = storage;
*/
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/langs',
      fallbackLocale: Locale('en'),
      startLocale: Locale('en'),
      saveLocale: true,
      child: const DreamHouse(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SettingsCubit(), // توفير الكيوبت
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: Theme.of(context).copyWith(
          scaffoldBackgroundColor: color4,
        ),
        // home: ProfileScreen(),
      ),
    );
  }
}

class DreamHouse extends StatelessWidget {
  const DreamHouse({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SettingsCubit(), // توفير الكيوبت هنا أيضًا
        ),
      ],
      child: MaterialApp(
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
        home: LoginScreen(),
      ),
    );
  }
}
