import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // إضافة الـ Bloc
import 'package:home_serviece/feature/auth/bloc/bloc/auth_bloc.dart';
import 'package:home_serviece/feature/auth/data/data_source/auth_datasource.dart'; // إضافة DataSource
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
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

class DreamHouse extends StatelessWidget {
  const DreamHouse({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // إضافة Bloc الخاص بتسجيل الدخول
        BlocProvider(
          create: (context) => AuthBloc(authDatasource: AuthDatasource()),
        ),
        // يمكنك إضافة المزيد من الـ Bloc الخاص بالـ Home أو الـ Profile هنا إذا كان هناك حاجة
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
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
