import 'package:get/get.dart';

import 'package:greengrocer/src/pages/auth/sign_in_screen.dart';
import 'package:greengrocer/src/pages/auth/sign_up_screen.dart';
import 'package:greengrocer/src/pages/base/base_screen.dart';
import 'package:greengrocer/src/pages/splash/splash_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.signin,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const BaseScreen(),
    ),
  ];
}

abstract class AppRoutes {
  static const String splash = '/splash';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String home = '/';
}
