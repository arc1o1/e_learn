import 'package:e_learn/features/profile/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'package:e_learn/features/auth/provider/auth_provider.dart';
import 'package:e_learn/features/auth/signin_screen/signin_view_model.dart';
import 'package:e_learn/features/auth/signup_screen/signup_view_model.dart';
import 'package:e_learn/features/bottom_nav_menu/bottom_nav_menu.dart';
import 'package:e_learn/features/bottom_nav_menu/notifier/bottom_nav_menu_notifier.dart';
import 'package:e_learn/features/payments/notifier/payment_notifier.dart';
import 'package:e_learn/features/school_level_category_screen/notifier/school_level_category_notifier.dart';
import 'package:e_learn/features/topics_screen/notifier/topics_notifier.dart';
import 'package:e_learn/services/auth_service.dart';
import 'package:e_learn/services/dio_service_locator.dart';
import 'package:e_learn/services/environment_service.dart';
import 'package:e_learn/services/notifications.dart';
import 'package:e_learn/services/routes.dart';
import 'package:e_learn/utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });

  // initialize notifications
  await NotificationServices().initNotification();

  //  initialize get storage
  await GetStorage.init();

  // load env file
  await dotenv.load(fileName: EnvironmentService.fileName);

  // create Dio instance and pass to AuthService
  // final dio = Dio(BaseOptions(baseUrl: EnvironmentService.appBaseUrl));
  // final authService = AuthService(dio);

  // setup dependency injection
  setupLocator();

  runApp(MultiProvider(
    providers: [
      // auth
      ChangeNotifierProvider(
        create: (_) => AuthProvider(locator<AuthService>()),
      ),
      ChangeNotifierProvider(create: (_) => SigninViewModel()),
      ChangeNotifierProvider(create: (_) => SignupViewModel()),

      // profile
      ChangeNotifierProvider(create: (_) => ProfileViewModel()),

      ChangeNotifierProvider(create: (_) => BottomNavigationNotifier()),
      ChangeNotifierProvider(create: (_) => SchoolLevelCategoryNotifier()),
      ChangeNotifierProvider(create: (_) => TopicsNotifier()),
      ChangeNotifierProvider(create: (_) => PaymentNotifier()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // var
    Size screenSize = MediaQuery.of(context).size;

    return ScreenUtilInit(
      designSize: screenSize,
      minTextAdapt: false,
      splitScreenMode: false,
      useInheritedMediaQuery: false,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'eLearn',
          themeMode: ThemeMode.light,
          theme: CustomTheme.lightTheme,
          routerConfig: router,
        );
      },
      child: const BottomNavMenu(),
    );
  }
}
