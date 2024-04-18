import 'package:flutter_metatube_app/utils/styles/app_colors.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SnackBarUtils {
  static showSuccessSnackBar(IconData icon, String message) {
    Get.back();

    Get.showSnackbar(
      GetSnackBar(
        icon: Icon(
          icon,
          color: AppColors.accent,
        ),
        message: message,
        shouldIconPulse: false,
        duration: const Duration(seconds: 2),
        maxWidth: Get.width / 3,
        borderRadius: 4,
      ),
    );
  }
}
