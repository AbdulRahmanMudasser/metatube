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
                  // button for new file
                  ReusableElevatedButton(onTap: () {}, title: "New File"),
                  Row(
                    children: [
                      // button to upload file
                      ReusableIconButton(onTap: () {}, icon: Icons.file_upload),
                      const SizedBox(
                        width: 8,
                      ),
                      // button to open folder
                      ReusableIconButton(onTap: () {}, icon: Icons.folder),
                    ],
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // text field for video title
                    ReusableTextField(
                      maxLength: 100,
                      maxLines: 3,
                      hintText: "Enter Video Title",
                      textEditingController: controller.titleTextEditingController,
                      onTap: () => controller.titleTextEditingController.text.isNotEmpty
                          ? Get.find<HomeController>()
                              .copyContentToClipboard(controller.titleTextEditingController.text)
                          : null,
                      iconColor: Get.find<HomeController>().titleTextFieldIconColor.value,
                      onChanged: (value) => controller.titleTextFieldOnChanged(value),
                      focusNode: controller.titleFocusNode,
                    ),

                    const SizedBox(
                      height: 40,
                    ),

                    // text field for video description
                    ReusableTextField(
                      maxLength: 4000,
                      maxLines: 6,
                      hintText: "Enter Video Description",
                      textEditingController: controller.descriptionTextEditingController,
                      onTap: () => controller.descriptionTextEditingController.text.isNotEmpty
                          ? Get.find<HomeController>()
                              .copyContentToClipboard(controller.descriptionTextEditingController.text)
                          : null,
                      iconColor: Get.find<HomeController>().descriptionTextFieldIconColor.value,
                      onChanged: (value) => controller.descriptionTextFieldOnChanged(value),
                      focusNode: controller.descriptionFocusNode,
                    ),

                    const SizedBox(
                      height: 40,
                    ),

                    // text field for video tags
                    ReusableTextField(
                      maxLength: 500,
                      maxLines: 5,
                      hintText: "Enter Video Tags",
                      textEditingController: controller.tagsTextEditingController,
                      onTap: () => controller.tagsTextEditingController.text.isNotEmpty
                          ? Get.find<HomeController>()
                          .copyContentToClipboard(controller.tagsTextEditingController.text)
                          : null,
                      iconColor: Get.find<HomeController>().tagsTextFieldIconColor.value,
                      onChanged: (value) => controller.tagsTextFieldOnChanged(value),
                      focusNode: controller.tagsFocusNode,
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // button to save file
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
