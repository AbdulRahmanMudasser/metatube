import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_metatube_app/controllers/home_controller.dart';
import 'package:flutter_metatube_app/utils/methods/date_format.dart';
import 'package:flutter_metatube_app/utils/methods/snack_bar.dart';

class FileService {
  /// Selected File
  File? _selectedFile;

  /// Directory Path to Save the Selected File
  String _selectedDirectory = '';

  // Instance of Home Controller for accessing input fields
  // final _controller = Get.put(HomeController());

  /// Method to save the file
  Future<void> saveFile(HomeController controller) async {
    // Grab the video title from title text field
    final title = controller.titleTextEditingController.text;

    // Grab the video description from the description text field
    final description = controller.descriptionTextEditingController.text;

    // Grab the video chapters from the chapters text field
    final chapters = controller.chaptersTextEditingController.text;

    // Grab the resources & links used in the video from the resources & links text field
    final resourceLinks = controller.resourceLinksTextEditingController.text;

    // Grab the video tags from tags text field
    final tags = controller.tagsTextEditingController.text;

    // Formatted file contents
    final fileContent = _formatFileContent(
      title: title,
      description: description,
      chapters: chapters,
      resourceLinks: resourceLinks,
      tags: tags,
    );

    try {
      if (_selectedFile != null) {
        // If a file is selected,

        // Write content to that file
        await _writeToFile(_selectedFile!, fileContent);
      } else {
        // If no file is selected,

        // Determine the save directory
        final directoryPath = await _getSaveDirectoryPath();

        // Generate a file name
        final fileName = _generateFileName(title, directoryPath);

        // Write content to new file
        await _writeToFile(File(fileName), fileContent);
      }

      // Display a success snackbar
      SnackBarUtils.showSuccessSnackBar(Icons.check_circle, "File Saved");
    } catch (exception) {
      // Handle exception
      _handleException(exception);
    }
  }

  /// Method to format the file content
  String _formatFileContent({
    required String title,
    required String description,
    required String chapters,
    required String resourceLinks,
    required String tags,
  }) {
    // Format in which our document will look like
    final titleFormat = "Title:\n\n$title\n\n";
    final descriptionFormat = "Description:\n\n$description\n\n";
    final chaptersFormat = "Chapters:\n\n$chapters\n\n";
    final resourceLinksFormat = "Resources & Links:\n\n$resourceLinks\n\n";
    final tagsFormat = "Tags:\n\n$tags\n\n";

    return "$titleFormat$descriptionFormat$chaptersFormat$resourceLinksFormat$tagsFormat";
  }

  /// Method to write to file
  Future<void> _writeToFile(File file, String content) async {
    await file.writeAsString(content);
  }

  /// Method to get the save directory
  Future<String> _getSaveDirectoryPath() async {
    if (_selectedDirectory.isEmpty) {
      // Prompts user to select a directory
      final directory = await FilePicker.platform.getDirectoryPath();
      _selectedDirectory = directory!;
    }

    return _selectedDirectory;
  }

  /// Method to generate the file name
  String _generateFileName(String title, String directoryPath) {
    // Save file with today's date
    final todayDate = DateFormatUtils.formatDate();

    return "$directoryPath/$todayDate - $title - MetaTube.txt";
  }

  /// Method to handle exceptions and display error snackbar
  void _handleException(dynamic exception) {
    // Print the exception to the log
    debugPrint("The following exception occurred while trying to save the file:\n\n$exception");

    // Display a error snackbar if something goes wrong
    SnackBarUtils.showErrorSnackBar(Icons.error, "Failed to Save File");
  }
}
