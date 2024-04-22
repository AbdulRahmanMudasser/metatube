import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_metatube_app/utils/methods/snack_bar.dart';
import 'package:flutter_metatube_app/utils/styles/app_colors.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  /// Instance of Home Controller
  static HomeController controller = Get.find<HomeController>();

  /// Text Editing Controllers
  late TextEditingController titleTextEditingController;
  late TextEditingController descriptionTextEditingController;
  late TextEditingController chaptersTextEditingController;
  late TextEditingController resourceLinksTextEditingController;
  late TextEditingController tagsTextEditingController;

  /// Focus Nodes
  late FocusNode titleFocusNode;
  late FocusNode descriptionFocusNode;
  late FocusNode chaptersFocusNode;
  late FocusNode resourceLinksFocusNode;
  late FocusNode tagsFocusNode;

  /// Reactive Variables for Text Field Icon Colors
  final titleIconColor = AppColors.medium.obs;
  final descriptionIconColor = AppColors.medium.obs;
  final chaptersIconColor = AppColors.medium.obs;
  final resourceLinksIconColor = AppColors.medium.obs;
  final tagsIconColor = AppColors.medium.obs;

  /// Save Button Enable State
  final isSaveButtonEnabled = false.obs;

  /// Instance of File Service Class
  // final fileService = FileService();

  @override
  void onInit() {
    super.onInit();
    _initializeControllers();
    _initializeFocusNodes();
    _initializeListeners();
  }

  /// Initialize text editing controllers
  void _initializeControllers() {
    titleTextEditingController = TextEditingController();
    descriptionTextEditingController = TextEditingController();
    chaptersTextEditingController = TextEditingController();
    resourceLinksTextEditingController = TextEditingController();
    tagsTextEditingController = TextEditingController();
  }

  /// Initialize focus nodes
  void _initializeFocusNodes() {
    titleFocusNode = FocusNode();
    descriptionFocusNode = FocusNode();
    chaptersFocusNode = FocusNode();
    resourceLinksFocusNode = FocusNode();
    tagsFocusNode = FocusNode();
  }

  /// Listener for title text field
  void _titleListener() {
    updateTitleIconColor(titleTextEditingController.text);
    updateSaveButtonState();
  }

  /// Listener for description text field
  void _descriptionListener() {
    updateDescriptionIconColor(descriptionTextEditingController.text);
    updateSaveButtonState();
  }

  /// Listener for chapters text field
  void _chaptersListener() {
    updateChaptersIconColor(chaptersTextEditingController.text);
    updateSaveButtonState();
  }

  /// Listener for resources & links text field
  void _resourceLinksListener() {
    updateResourceLinksIconColor(resourceLinksTextEditingController.text);
    updateSaveButtonState();
  }

  /// Listener for tags text field
  void _tagsListener() {
    updateTagsIconColor(tagsTextEditingController.text);
    updateSaveButtonState();
  }

  /// Initialize listeners for text fields
  void _initializeListeners() {
    titleTextEditingController.addListener(_titleListener);
    descriptionTextEditingController.addListener(_descriptionListener);
    chaptersTextEditingController.addListener(_chaptersListener);
    resourceLinksTextEditingController.addListener(_resourceLinksListener);
    tagsTextEditingController.addListener(_tagsListener);
  }

  @override
  void onClose() {
    _disposeControllers();
    _disposeFocusNodes();
    _disposeListeners();
    super.onClose();
  }

  /// Dispose text editing controllers
  void _disposeControllers() {
    titleTextEditingController.dispose();
    descriptionTextEditingController.dispose();
    chaptersTextEditingController.dispose();
    resourceLinksTextEditingController.dispose();
    tagsTextEditingController.dispose();
  }

  /// Dispose focus nodes
  void _disposeFocusNodes() {
    titleFocusNode.dispose();
    descriptionFocusNode.dispose();
    chaptersFocusNode.dispose();
    resourceLinksFocusNode.dispose();
    tagsFocusNode.dispose();
  }

  /// Dispose text editing listeners
  void _disposeListeners() {
    titleTextEditingController.removeListener(_titleListener);
    descriptionTextEditingController.removeListener(_descriptionListener);
    chaptersTextEditingController.removeListener(_chaptersListener);
    resourceLinksTextEditingController.removeListener(_resourceLinksListener);
    tagsTextEditingController.removeListener(_tagsListener);
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

  /// Copy the content only if text field is not empty
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

  /// Updates the chapters text field icon color based on the text field value
  updateChaptersIconColor(String value) {
    chaptersIconColor.value = value.isNotEmpty ? AppColors.accent : AppColors.medium;
  }

  /// Updates the resources & links text field color based on the text field value
  updateResourceLinksIconColor(String value) {
    resourceLinksIconColor.value = value.isNotEmpty ? AppColors.accent : AppColors.medium;
  }

  /// Updates the tags text field icon color based on the text field value
  updateTagsIconColor(String value) {
    tagsIconColor.value = value.isNotEmpty ? AppColors.accent : AppColors.medium;
  }

  /// Update the state of save button
  void updateSaveButtonState() {
    isSaveButtonEnabled.value = titleTextEditingController.text.isNotEmpty &&
        descriptionTextEditingController.text.isNotEmpty &&
        chaptersTextEditingController.text.isNotEmpty &&
        resourceLinksTextEditingController.text.isNotEmpty &&
        tagsTextEditingController.text.isNotEmpty;
  }

  /// Save File Locally
  // saveFile() {
  //   if (isSaveButtonEnabled.value) {
  //     fileService.saveFile(Get.find<HomeController>());
  //   }
  // }

  /// Load File to Application
  // loadFile() {
  //   fileService.loadFile(Get.find<HomeController>());
  // }
}
