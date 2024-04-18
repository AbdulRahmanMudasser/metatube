import 'package:flutter/material.dart';
import 'package:flutter_metatube_app/utils/styles/app_colors.dart';

class AppButtonStyles {
  static ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    shape:  RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    backgroundColor: AppColors.accent,
    foregroundColor: AppColors.dark,
    disabledBackgroundColor: AppColors.disabledBackgroundColor,
    disabledForegroundColor: AppColors.disabledForegroundColor,
  );
}
