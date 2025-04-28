import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // إضافة الـ Bloc
import 'package:home_serviece/feature/auth/bloc/bloc/auth_bloc.dart';
import 'package:home_serviece/feature/auth/data/data_source/auth_datasource.dart'; // إضافة DataSource
import 'package:home_serviece/feature/auth/presentation/screen/iam_looking_for.dart';
import 'package:home_serviece/feature/auth/presentation/screen/login_screen.dart';
import 'package:home_serviece/feature/auth/presentation/screen/signup_user.dart';
import 'package:home_serviece/feature/auth/presentation/screen/signup_worker.dart';
import 'package:home_serviece/feature/estate/presentation/screen/fav_screen.dart';
import 'package:home_serviece/feature/estate/presentation/widget/fav_manger.dart';
import 'package:home_serviece/feature/home/bloc/cubit/settings_cubit.dart';
import 'package:home_serviece/feature/home/bloc/cubit/settings_state.dart';
import 'package:home_serviece/feature/home/presentation/screen/edit_profile.dart';
import 'package:home_serviece/feature/home/presentation/screen/home_screen.dart';
import 'package:home_serviece/feature/home/presentation/screen/navbar.dart';
import 'package:home_serviece/feature/home/presentation/screen/profile.dart';
import 'package:home_serviece/feature/home/presentation/screen/services_screen.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final tempDir = await getTemporaryDirectory();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory(tempDir.path));
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', ''), Locale('ar', '')],
      path: 'assets/langs',
      fallbackLocale: Locale('en', ''),
      startLocale: Locale('en', ''),
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
          BlocProvider(
            create: (context) => AuthBloc(authDatasource: AuthDatasource()),
          ),
          BlocProvider(
            create: (_) => SettingsCubit(),
          ),
        ],
        child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, State) {
          return MaterialApp(
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            theme:
                State.isDarkModeEnabled ? ThemeData.dark() : ThemeData.light(),
            routes: {
              IamLookingFor.id: (context) => const IamLookingFor(),
              LoginScreen.id: (context) => LoginScreen(),
              SignupUser.id: (context) => SignupUser(),
              SignupWorker.id: (context) => SignupWorker(),
              EditProfile.id: (context) => EditProfile(),
              HomeScreen.id: (context) => const HomeScreen(),
              ProfileScreen.id: (context) => const ProfileScreen(),
              ServicesScreen.id: (context) => const ServicesScreen(),
              '/favorites': (context) => FavoritesScreen(
                    favoriteEstates: FavoriteManager.favoriteEstates,
                  ),
            },
            debugShowCheckedModeBanner: false,
            home: Navbar(),
          );
        }));
  }
}
