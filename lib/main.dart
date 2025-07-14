import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/core/unified_api/api_variabels.dart';
import 'package:home_serviece/feature/address/bloc/bloc/bloc/address_bloc.dart';
import 'package:home_serviece/feature/address/data/data_source/address_datasource.dart';
import 'package:home_serviece/feature/auth/bloc/bloc/auth_bloc.dart';
import 'package:home_serviece/feature/auth/data/data_source/auth_datasource.dart';
import 'package:home_serviece/feature/auth/presentation/screen/iam_looking_for.dart';
import 'package:home_serviece/feature/auth/presentation/screen/login_screen.dart';
import 'package:home_serviece/feature/auth/presentation/screen/signup_user.dart';
import 'package:home_serviece/feature/auth/presentation/screen/signup_worker.dart';
import 'package:home_serviece/feature/estate/presentation/screen/fav_screen.dart';
import 'package:home_serviece/feature/estate/presentation/widget/fav_manger.dart';
import 'package:home_serviece/feature/home/bloc/cubit/settings_cubit.dart';
import 'package:home_serviece/feature/home/bloc/cubit/settings_state.dart';
import 'package:home_serviece/feature/home/presentation/screen/home_screen.dart';
import 'package:home_serviece/feature/home/presentation/screen/navbar.dart';
import 'package:home_serviece/feature/home/presentation/screen/profile.dart';
import 'package:home_serviece/feature/order/bloc/bloc/order_bloc.dart';
import 'package:home_serviece/feature/order/data/data_source/order_datasource.dart';
import 'package:home_serviece/feature/service/presentation/screen/services_screen.dart';
import 'package:home_serviece/feature/home/bloc/bloc/home_bloc.dart'; // تأكد أنك أضفت هذا الاستيراد
import 'package:home_serviece/feature/home/data/data_source/home_datasource.dart'; // لو عندك datasource
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final tempDir = await getTemporaryDirectory();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(tempDir.path),
  );
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', ''), Locale('ar', '')],
      path: 'assets/langs',
      fallbackLocale: const Locale('en', ''),
      startLocale: const Locale('en', ''),
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
          create: (_) => AuthBloc(authDatasource: AuthDatasource()),
        ),
        BlocProvider(
          create: (_) => SettingsCubit(),
        ),
        BlocProvider(
          create: (_) => AddressBloc(dataSource: AddressDataSource()),
        ),
        BlocProvider(
          create: (_) =>
              HomeBloc(homeDatasource: HomeDatasource()), // أضف الـ HomeBloc
        ),
        BlocProvider(
          create: (_) => OrderBloc(
              dataSource: OrderDataSource(
                  apiVariabels: ApiVariabels())), // أضف الـ HomeBloc
        ),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            theme:
                state.isDarkModeEnabled ? ThemeData.dark() : ThemeData.light(),
            debugShowCheckedModeBanner: false,
            home: LoginScreen(),
            routes: {
              IamLookingFor.id: (context) => const IamLookingFor(),
              LoginScreen.id: (context) => LoginScreen(),
              SignupUser.id: (context) => SignupUser(),
              SignupWorker.id: (context) => SignupWorker(),
              HomeScreen.id: (context) => const HomeScreen(),
              ProfileScreen.id: (context) => const ProfileScreen(),
              ServicesScreen.id: (context) => ServicesScreen(),
              '/favorites': (context) => FavoritesScreen(
                    favoriteEstates: FavoriteManager.favoriteEstates,
                  ),
            },
          );
        },
      ),
    );
  }
}
