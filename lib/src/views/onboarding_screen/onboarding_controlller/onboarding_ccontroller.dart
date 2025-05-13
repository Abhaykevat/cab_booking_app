import 'package:cab_booking_app/src/views/connecting_driver_bottom_sheet/connecting_to_driver.dart';

import '../../../constants/app_linker/app_linker.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;
  final pageController = PageController();

  final List<OnboardingInfo> pages = [
    OnboardingInfo(
      title: AppStringsAssets.onboardingTitle1,
      description: AppStringsAssets.onboardingDescription1,
      image: AppImageAssets.onboarding1,
    ),
    OnboardingInfo(
      title: AppStringsAssets.onboardingTitle2,
      description: AppStringsAssets.onboardingDescription2,
      image: AppImageAssets.onboarding2,
    ),
    OnboardingInfo(
      title: AppStringsAssets.onboardingTitle3,
      description: AppStringsAssets.onboardingDescription3,
      image: AppImageAssets.onboarding3,
    ),
  ];

  void nextPage() {
    if (currentPage.value < pages.length - 1) {
      currentPage.value++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.off(ConnectingToDriverBottomSheet());
    }
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  double get progressValue => (currentPage.value + 1) / pages.length;
}
