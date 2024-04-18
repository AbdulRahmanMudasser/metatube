import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_metatube_app/utils/methods/snack_bar.dart';
import 'package:flutter_metatube_app/utils/styles/app_colors.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  /// Text Editing Controllers
  late TextEditingController titleTextEditingController;
  late TextEditingController descriptionTextEditingController;
  late TextEditingController tagsTextEditingController;

  /// Focus Nodes
  late FocusNode titleFocusNode;
  late FocusNode descriptionFocusNode;
  late FocusNode tagsFocusNode;

  /// Reactive Variables for Text Field Icon Colors
  final titleIconColor = AppColors.medium.obs;
  final descriptionIconColor = AppColors.medium.obs;
  final tagsIconColor = AppColors.medium.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeControllers();
    _initializeFocusNodes();
  }

  /// Initialize text editing controllers
  void _initializeControllers() {
    titleTextEditingController = TextEditingController();
    descriptionTextEditingController = TextEditingController();
    tagsTextEditingController = TextEditingController();
  }

  /// Initialize focus nodes
  void _initializeFocusNodes() {
    titleFocusNode = FocusNode();
    descriptionFocusNode = FocusNode();
    tagsFocusNode = FocusNode();
  }

  @override
  void onClose() {
    _disposeControllers();
    _disposeFocusNodes();
    super.onClose();
  }

  /// Dispose text editing controllers
  void _disposeControllers() {
    titleTextEditingController.dispose();
    descriptionTextEditingController.dispose();
    tagsTextEditingController.dispose();
  }

  /// Dispose focus nodes
  void _disposeFocusNodes() {
    titleFocusNode.dispose();
    descriptionFocusNode.dispose();
    tagsFocusNode.dispose();
  }

  /// Move focus to the next text field
  focusToNext() {
    FocusScope.of(Get.context!).nextFocus();
  }

  /// Copy the given content to the clipboard and show a success snackbar
  void copyContentToClipboard(String content) {
    Clipboard.setData(ClipboardData(text: content));
    SnackBarUtils.showSuccessSnackBar(
      Icons.content_copy_rounded,
      "Copied to Clipboard",
    );
  }

  copyOnlyIfTextFieldIsNotEmpty(TextEditingController controller) {
    if (controller.text.isNotEmpty) {
      copyContentToClipboard(controller.text);
    }
  }

  /// Updates the title text field icon color based on the text field value
  updateTitleIconColor(String value) {
    titleIconColor.value = value.isNotEmpty ? AppColors.accent : AppColors.medium;
  }

  /// Updates the description text field icon color based on the text field value
  updateDescriptionIconColor(String value) {
    descriptionIconColor.value = value.isNotEmpty ? AppColors.accent : AppColors.medium;
  }

  /// Updates the tags  text field icon color based on the text field value
  updateTagsIconColor(String value) {
    tagsIconColor.value = value.isNotEmpty ? AppColors.accent : AppColors.medium;
  }
}
