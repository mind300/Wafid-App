
import 'package:flutter/material.dart';
import 'package:wafid_app/core/routing/routes.dart';
import 'package:wafid_app/features/auth/forget_pass/forget_password_screen.dart';
import 'package:wafid_app/features/auth/signin/login_screen.dart';
import 'package:wafid_app/features/auth/sigup/signup_screen.dart';

import '../../features/splash_screen.dart';



class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {

      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

        case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
        case Routes.forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());

      // case Routes.registerScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (_) => getIt<RegisterCubit>(),
      //       child: const SignupScreen(),
      //     ),
      //   );


      // case Routes.setPasswordScreen:
      //   final email = args as String;
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (_) => getIt<SetPasswordCubit>(),
      //       child: SetPasswordScreen(email: email),
      //     ),
      //   );



      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
