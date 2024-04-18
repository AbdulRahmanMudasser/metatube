import 'package:flutter/material.dart';
import 'package:flutter_metatube_app/controllers/home_controller.dart';
import 'package:flutter_metatube_app/utils/styles/app_colors.dart';
import 'package:flutter_metatube_app/widgets/reusable_elevated_button.dart';
import 'package:flutter_metatube_app/widgets/reusable_text_field.dart';
import 'package:get/get.dart';

import '../widgets/reusable_icon_button.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Button for new file
                  ReusableElevatedButton(onTap: () {}, title: "New File"),
                  Row(
                    children: [
                      // Button to upload file
                      ReusableIconButton(onTap: () {}, icon: Icons.file_upload),
                      const SizedBox(width: 8),
                      // Button to open folder
                      ReusableIconButton(onTap: () {}, icon: Icons.folder),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text field for video title
                    ReusableTextField(
                      maxLength: 100,
                      maxLines: 3,
                      hintText: "Enter Video Title",
                      textEditingController: controller.titleTextEditingController,
                      onTap: () => controller.copyOnlyIfTextFieldIsNotEmpty(
                        controller.titleTextEditingController,
                      ),
                      iconColor: Get.find<HomeController>().titleIconColor.value,
                      onChanged: (value) => controller.updateTitleIconColor(value),
                      focusNode: controller.titleFocusNode,
                    ),

                    const SizedBox(height: 40),

                    // Text field for video description
                    ReusableTextField(
                      maxLength: 4000,
                      maxLines: 5,
                      hintText: "Enter Video Description",
                      textEditingController: controller.descriptionTextEditingController,
                      onTap: () => controller.copyOnlyIfTextFieldIsNotEmpty(
                        controller.descriptionTextEditingController,
                      ),
                      iconColor: Get.find<HomeController>().descriptionIconColor.value,
                      onChanged: (value) => controller.updateDescriptionIconColor(value),
                      focusNode: controller.descriptionFocusNode,
                    ),

                    const SizedBox(height: 40),

                    // Text field for video tags
                    ReusableTextField(
                      maxLength: 500,
                      maxLines: 3,
                      hintText: "Enter Video Tags",
                      textEditingController: controller.tagsTextEditingController,
                      onTap: () => controller.copyOnlyIfTextFieldIsNotEmpty(
                        controller.tagsTextEditingController,
                      ),
                      iconColor: Get.find<HomeController>().tagsIconColor.value,
                      onChanged: (value) => controller.updateTagsIconColor(value),
                      focusNode: controller.tagsFocusNode,
                    ),

                    const SizedBox(height: 20),

                    // Button to save file
                    ReusableElevatedButton(onTap: () {}, title: "Save File"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
