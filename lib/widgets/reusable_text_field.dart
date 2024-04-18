import 'package:flutter/material.dart';
import 'package:flutter_metatube_app/controllers/home_controller.dart';
import 'package:flutter_metatube_app/utils/styles/app_colors.dart';
import 'package:flutter_metatube_app/utils/styles/app_text_styles.dart';
import 'package:get/get.dart';
import 'reusable_icon_button.dart';

class ReusableTextField extends StatelessWidget {
  const ReusableTextField({
    super.key,
    required this.maxLength,
    this.maxLines,
    required this.hintText,
    required this.textEditingController,
    required this.onTap,
    required this.iconColor,
    required this.onChanged,
    required this.focusNode,
  });

  final int maxLength;
  final int? maxLines;
  final String hintText;
  final TextEditingController textEditingController;
  final GestureTapCallback onTap;
  final Color iconColor;
  final Function(String)? onChanged;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      onEditingComplete: () => Get.find<HomeController>().focusToNext(),
      controller: textEditingController,
      maxLines: maxLines ?? 5,
      maxLength: maxLength,
      keyboardType: TextInputType.multiline,
      cursorColor: AppColors.accent,
      style: AppTextStyles.lightTextStyle,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.mediumTextStyle,
        counterStyle: AppTextStyles.mediumTextStyle.copyWith(fontSize: 14),
        suffixIcon: ReusableIconButton(
          onTap: onTap,
          icon: Icons.content_copy_rounded,
          color: iconColor,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.medium),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.medium),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.accent),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.accent),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.medium),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.medium),
        ),
      ),
    );
  }
}
