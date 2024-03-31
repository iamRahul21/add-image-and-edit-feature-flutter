// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'image_editing.dart';

Future<void> showImagePickerDialog(
    BuildContext context, Function(String) onImageSelected) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    // Handle the picked image file
    print('Image picked: ${pickedFile.path}');
    onImageSelected(pickedFile.path); // Pass the selected image file path to the callback function

    // Navigate to the ImageEditingPage and pass the selected image path as a parameter
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageEditingPage(imagePath: pickedFile.path),
      ),
    );
  } else {
    // User canceled image picking
    print('User canceled image picking');
  }
}

