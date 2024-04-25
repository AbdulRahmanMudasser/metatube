import 'package:flutter/material.dart';
import 'package:flutter_metatube_app/utils/styles/app_colors.dart';

class AppTextStyles {
  /// Text style for light-themed text
  static TextStyle lightTextStyle = const TextStyle(
    color: AppColors.light,
    fontSize: 18,
  );

  /// Text style for medium-themed text
  static TextStyle mediumTextStyle = const TextStyle(
    color: AppColors.medium,
  );

  /// Text style for splash page
  static TextStyle splashTextStyle = const TextStyle(
    color: AppColors.accent,
    fontSize: 25,
    fontWeight: FontWeight.w500,
  );
}
