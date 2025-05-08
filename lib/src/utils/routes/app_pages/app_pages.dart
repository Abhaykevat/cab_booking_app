

import '../../../constants/app_linker/app_linker.dart';

class AppPages {
  static final pages = [
    // GetPage(
    //   name: AppRoutes.splash,
    //   page: () => const SplashScreen(),
    // binding: SplashBinding(),
    // ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingScreen(),
      binding: OnboardingBinding(),
    ),
  ];
}
