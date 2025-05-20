import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafid_app/core/theming/colors.dart';

import 'core/di/injections.dart';
import 'core/local/secure_storage/secure_storage.dart';
import 'core/local/shared_preferences/shared_pref_services.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefServices.init();
  await SecureStorage.init();
  setupGetIt();

  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Wafid App',
          theme: ThemeData(
            scaffoldBackgroundColor: ColorsManager.whiteColor,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          initialRoute: Routes.splashScreen,
          onGenerateRoute: appRouter.generateRoute,
        );

      },
    );
  }
}