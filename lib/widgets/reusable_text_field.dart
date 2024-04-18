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

  /// Maximum length of the text field
  final int maxLength;

  /// Maximum lines the text field can have
  final int? maxLines;

  /// Hint text to be displayed when the text field is empty
  final String hintText;

  /// Controller for the text field
  final TextEditingController textEditingController;

  /// Callback function when the suffix icon is tapped
  final GestureTapCallback onTap;

  /// Color of the icon associated with the text field
  final Color iconColor;

  /// Callback when the text in the text field is changed
  final Function(String) onChanged;

  /// Focus node for the text field
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
        border: _outlineInputBorder(AppColors.medium),
        enabledBorder: _outlineInputBorder(AppColors.medium),
        focusedBorder: _outlineInputBorder(AppColors.accent),
        focusedErrorBorder: _outlineInputBorder(AppColors.accent),
        errorBorder: _outlineInputBorder(AppColors.medium),
        disabledBorder: _outlineInputBorder(AppColors.medium),
      ),
    );
  }

  /// Creates an Outline Input Border with the specified color
  OutlineInputBorder _outlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
    );
  }
}
