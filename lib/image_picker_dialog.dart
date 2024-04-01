// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'image_editing_page.dart';

Future<void> showImagePickerDialog(
    BuildContext context, Function(String) onImageSelected) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    print('Image picked: ${pickedFile.path}');
    onImageSelected(pickedFile
        .path); 

    final croppedImagePath = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageEditingPage(imagePath: pickedFile.path),
      ),
    );

    if (croppedImagePath != null) {
      onImageSelected(croppedImagePath);
    }
  } else {
    print('User canceled image picking');
  }
}
