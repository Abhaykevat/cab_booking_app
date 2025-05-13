// controllers/loading_controller.dart
import 'package:get/get.dart';
import 'dart:async';

class LoadingController extends GetxController {
  var activeIndex = 0.obs;
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    _timer = Timer.periodic(Duration(milliseconds: 300), (timer) {
      activeIndex.value = (activeIndex.value + 1) % 4;
    });
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
