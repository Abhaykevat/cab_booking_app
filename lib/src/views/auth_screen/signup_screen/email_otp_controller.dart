import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  var otpList = List.generate(4, (index) => ''.obs);
  var countdown = 1.obs; // Just to match UI screenshot

  List<TextEditingController> textControllers = 
      List.generate(4, (_) => TextEditingController());

  void updateOtp(int index, String value) {
    otpList[index].value = value;
    if (value.isNotEmpty && index < 3) {
      Get.focusScope?.nextFocus();
    }
  }

  String getOtp() {
    return otpList.map((e) => e.value).join();
  }
}
