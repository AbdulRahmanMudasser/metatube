import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_metatube_app/utils/methods/snack_bar.dart';
import 'package:flutter_metatube_app/utils/styles/app_colors.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // text editing controller
  late TextEditingController titleTextEditingController;
  late TextEditingController descriptionTextEditingController;
  late TextEditingController tagsTextEditingController;

  // focus node
  late FocusNode titleFocusNode;
  late FocusNode descriptionFocusNode;
  late FocusNode tagsFocusNode;

  Rx<Color> titleTextFieldIconColor = AppColors.medium.obs;
  Rx<Color> descriptionTextFieldIconColor = AppColors.medium.obs;
  Rx<Color> tagsTextFieldIconColor = AppColors.medium.obs;

  // method to focus on next widget
  focusToNext() {
    FocusScope.of(Get.context!).nextFocus();
  }

  // method to copy text field context to clipboard
  copyContentToClipboard(String content) {
    Clipboard.setData(
      ClipboardData(text: content),
    );

    SnackBarUtils.showSuccessSnackBar(
      Icons.content_copy_rounded,
      "Copied to Clipboard",
    );
  }

  titleTextFieldOnChanged(String value) {
    if (value.isNotEmpty) {
      titleTextFieldIconColor.value = AppColors.accent;
    } else {
      titleTextFieldIconColor.value = AppColors.medium;
    }
  }

  descriptionTextFieldOnChanged(String value) {
    if (value.isNotEmpty) {
      descriptionTextFieldIconColor.value = AppColors.accent;
    } else {
      descriptionTextFieldIconColor.value = AppColors.medium;
    }
  }

  tagsTextFieldOnChanged(String value) {
    if (value.isNotEmpty) {
      tagsTextFieldIconColor.value = AppColors.accent;
    } else {
      tagsTextFieldIconColor.value = AppColors.medium;
    }
  }

  @override
  void onInit() {
    super.onInit();

    titleTextEditingController = TextEditingController();
    descriptionTextEditingController = TextEditingController();
    tagsTextEditingController = TextEditingController();

    titleFocusNode = FocusNode();
    descriptionFocusNode = FocusNode();
    tagsFocusNode = FocusNode();
  }

  @override
  void onClose() {
    titleTextEditingController.dispose();
    descriptionTextEditingController.dispose();
    tagsTextEditingController.dispose();

    titleFocusNode.dispose();
    descriptionFocusNode.dispose();
    tagsFocusNode.dispose();

    super.onClose();
  }
}
