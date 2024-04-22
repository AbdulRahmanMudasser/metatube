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

  /// Instance of Home Controller for accessing input fields
  // final _controller = HomeController.controller;

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

        // Create a file from file name
        final file = _createFile(fileName);

        // Write content to new file
        await _writeToFile(file, fileContent);
      }

      // Display a success snackbar
      SnackBarUtils.showSuccessSnackBar(Icons.check_circle, "File Saved");
    } catch (exception) {
      // Handle exception
      _handleException(exception, "Failed to Save File");
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

      // Assign the directory selected by the user
      _selectedDirectory = directory!;
    }

    return _selectedDirectory;
  }

  /// Method to get the save directory
  // Future<String> _getSaveDirectoryPath() async {
  //   if (_selectedDirectory.isEmpty) {
  //     if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
  //       // For Desktop Platforms
  //       // Prompts user to select a directory
  //       final directory = await FilePicker.platform.getDirectoryPath();
  //
  //       // Assign the directory selected by the user
  //       _selectedDirectory = directory!;
  //     } else {
  //       // For Web Platforms
  //       _selectedDirectory = _getWebDirectoryPath();
  //     }
  //   }
  //
  //   return _selectedDirectory;
  // }

  /// Method to get directory in web
  // String _getWebDirectoryPath() {
  //   if (html.window.localStorage['saveDirectory'] != null) {
  //     return html.window.localStorage['saveDirectory']!;
  //   } else {
  //     return '';
  //   }
  // }

  /// Method to generate the file name
  String _generateFileName(String title, String directoryPath) {
    // Save file with today's date
    final todayDate = DateFormatUtils.formatDate();

    // Returns the File Name
    return "$directoryPath/$todayDate - $title - MetaTube.txt";
  }

  /// Method to load & read the file
  Future<void> loadFile(HomeController controller) async {
    try {
      // Prompts the user to select a file
      FilePickerResult? filePickerResult = await _pickFile();

      if (filePickerResult != null) {
        // If user has selected a file,
        // Then, grab the path of file that is picked
        final filePath = _getFilePath(filePickerResult);

        // Convert the path into file
        final file = _createFile(filePath);

        // Assign the file to selected file
        _selectedFile = file;

        // Read file content
        final fileContent = await _readFileContent(file);

        // Split the content according to a pattern
        final splittedFileContent = _splitFileContent(fileContent);

        // Populate text field from splitted file content
        _populateTextFieldsWithSplittedContent(controller, splittedFileContent);

        // Display a success snackbar
        SnackBarUtils.showSuccessSnackBar(Icons.upload_file, "File Loaded");
      } else {
        // If user has not selected a file,
        // Display a error snackbar
        SnackBarUtils.showErrorSnackBar(Icons.error_rounded, "No File Selected");
      }
    } catch (exception) {
      // Handle exception
      _handleException(exception, "Failed to Load File");
    }
  }

  /// Prompts the user to select a file using File Picker and returns the result
  Future<FilePickerResult?> _pickFile() async {
    return await FilePicker.platform.pickFiles();
  }

  /// Grab the path of the selected file
  String _getFilePath(FilePickerResult filePickerResult) {
    return filePickerResult.files.single.path!;
  }

  /// Reads the content of given file and returns is as a string
  Future<String> _readFileContent(File file) async {
    return await file.readAsString();
  }

  /// Split the file content according to a pattern and return them as a list
  List<String> _splitFileContent(String fileContent) {
    return fileContent.split('\n\n');
  }

  /// Safely retrieves the value from the given splitted file content based on the specified index
  String _getValueFromSplittedContent(List<String> splittedFileContent, int index) {
    return splittedFileContent.length > index ? splittedFileContent[index] : '';
  }

  /// Populates the text fields with value retrieved from splitted file content
  void _populateTextFieldsWithSplittedContent(HomeController controller, List<String> splittedFileContent) {
    controller.titleTextEditingController.text = _getValueFromSplittedContent(splittedFileContent, 1);
    controller.descriptionTextEditingController.text = _getValueFromSplittedContent(splittedFileContent, 3);
    controller.chaptersTextEditingController.text = _getValueFromSplittedContent(splittedFileContent, 5);
    controller.resourceLinksTextEditingController.text = _getValueFromSplittedContent(splittedFileContent, 7);
    controller.tagsTextEditingController.text = _getValueFromSplittedContent(splittedFileContent, 9);
  }

  /// Method to create a new file
  void createFile(HomeController controller) {
    // Make the selected file variable null
    _resetSelectedFile();

    // Make the controllers null
    controller.clearAllTextEditingControllers();

    // Show success snackbar
    SnackBarUtils.showSuccessSnackBar(Icons.note_add, 'New File Created');
  }

  /// Method to make the selected file null
  void _resetSelectedFile() {
    _selectedFile = null;
  }

  /// '''
  /// Commonly Used Helper Methods
  /// '''

  /// Create a file from file path or file name
  File _createFile(String filePath) {
    return File(filePath);
  }

  /// Method to handle exceptions and display error snackbar
  void _handleException(dynamic exception, String message) {
    // Print the exception to the log
    debugPrint("The following exception occurred while trying to save the file:\n\n$exception");

    // Display a error snackbar if something goes wrong
    SnackBarUtils.showErrorSnackBar(Icons.error, message);
  }
}
