import 'package:flutter_metatube_app/utils/styles/app_colors.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SnackBarUtils {
  /// Display a success snackbar with icon and message
  static void showSuccessSnackBar(IconData icon, String message) {
    // Dismiss any existing snackbar
    Get.back();

    // Show the success snackbar
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
