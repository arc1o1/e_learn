import 'package:e_learn/features/bottom_nav_menu/bottom_nav_menu.dart';
import 'package:e_learn/features/bottom_nav_menu/bottom_nav_menu_notifier.dart';
import 'package:e_learn/features/categories_screen/category_notifier.dart';
import 'package:e_learn/services/notifications.dart';
import 'package:e_learn/utils/routes/routes.dart';
import 'package:e_learn/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

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
  GetStorage.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => BottomNavigationNotifier()),
      ChangeNotifierProvider(create: (_) => SchoolCategoryNotifier()),
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
