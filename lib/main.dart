// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:home_serviece/core/unified_api/api_variabels.dart';
import 'package:home_serviece/feature/address/bloc/bloc/bloc/address_bloc.dart';
import 'package:home_serviece/feature/address/data/data_source/address_datasource.dart';
import 'package:home_serviece/feature/auth/bloc/bloc/auth_bloc.dart';
import 'package:home_serviece/feature/auth/data/data_source/auth_datasource.dart';
import 'package:home_serviece/feature/auth/presentation/screen/iam_looking_for.dart';
import 'package:home_serviece/feature/auth/presentation/screen/login_screen.dart';
import 'package:home_serviece/feature/auth/presentation/screen/signup_user.dart';
import 'package:home_serviece/feature/auth/presentation/screen/signup_worker.dart';
import 'package:home_serviece/feature/estate/bloc/bloc/estate_bloc.dart';
import 'package:home_serviece/feature/estate/data/data_source/estate_datasource.dart';
import 'package:home_serviece/feature/estate/presentation/screen/fav_screen.dart';
import 'package:home_serviece/feature/estate/presentation/widget/fav_manger.dart';
import 'package:home_serviece/feature/home/bloc/bloc/home_bloc.dart'; // تأكد أنك أضفت هذا الاستيراد
import 'package:home_serviece/feature/home/bloc/cubit/settings_cubit.dart';
import 'package:home_serviece/feature/home/bloc/cubit/settings_state.dart';
import 'package:home_serviece/feature/home/data/data_source/home_datasource.dart'; // لو عندك datasource
import 'package:home_serviece/feature/home/presentation/screen/home_screen.dart';
import 'package:home_serviece/feature/home/presentation/screen/profile.dart';
import 'package:home_serviece/feature/onbording/pages/onbording_screen.dart';
import 'package:home_serviece/feature/order/bloc/bloc/order_bloc.dart';
import 'package:home_serviece/feature/order/data/data_source/order_datasource.dart';
import 'package:home_serviece/feature/service/bloc/bloc/service_bloc.dart';
import 'package:home_serviece/feature/service/data/data_source/service_datasource.dart';
import 'package:home_serviece/feature/service/presentation/screen/services_screen.dart';
import 'package:home_serviece/feature/wallet/bloc/wallet_bloc.dart';
import 'package:home_serviece/feature/wallet/data/data_source/wallet_datasource.dart';
import 'package:home_serviece/firebase_options.dart';
import 'package:home_serviece/generated/notification/cubit/notification_cubit.dart';
import 'package:home_serviece/generated/notification/data/repo/notification_repository.dart';

import 'core/utils/notification_utils.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        // Allow only for local dev server
        if (host == "10.0.2.2" || host == "localhost") {
          return true;
        }
        return false;
      };
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // هي بتشتغل بالخلفية
  print('Received a background message: ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  final sharedPreferences = await SharedPreferences.getInstance();
  final notification_repository = NotificationRepository(sharedPreferences);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await LocalNotificationService.initialize();
  await NotificationService().initialize();
  await NotificationService().getToken();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

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
      child: DreamHouse(
        notificationRepository: notification_repository,
      ),
    ),
  );
}

class DreamHouse extends StatelessWidget {
  final NotificationRepository notificationRepository;

  const DreamHouse({
    Key? key,
    required this.notificationRepository,
  }) : super(key: key);

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
          create: (_) => EstateBloc(estateDatasource: EstateDatasource()),
        ),
        BlocProvider(
          create: (_) => OrderBloc(
              dataSource: OrderDataSource(
                  apiVariabels: ApiVariabels())), // أضف الـ HomeBloc
        ),
        BlocProvider(
          create: (_) => WalletBloc(
              dataSource: WalletDataSource(
                  apiVariabels: ApiVariabels())), // أضف الـ HomeBloc
        ),
        BlocProvider(
          create: (_) => ServiceBloc(
              dataSource: ServiceDataSource(
                  apiVariabels: ApiVariabels())), // أضف الـ HomeBloc
        ),
        BlocProvider<NotificationCubit>(
          create: (_) {
            final cubit = NotificationCubit(notificationRepository);
            // NotificationUtils().setCubit(cubit); // ✅ ربط الكيوبت مع NotificationUtils
            return cubit;
          },
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
            home: OnbordingScreen(),
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
