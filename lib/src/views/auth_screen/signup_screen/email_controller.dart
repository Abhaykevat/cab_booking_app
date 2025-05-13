import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EmailController extends GetxController {
  final emailController = TextEditingController();
  final isValidEmail = false.obs;

  void validateEmail(String value) {
    isValidEmail.value = GetUtils.isEmail(value);
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
