import 'package:flutter/material.dart';
import 'image_picker_dialog.dart';
import 'dart:io';

class MyHomePage extends StatefulWidget {
  final String title;
  final void Function(String) navigateToUploadPopup;

  const MyHomePage({super.key, required this.title, required this.navigateToUploadPopup});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  String _selectedImagePath = ''; // Store the selected image file path

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth * 0.95;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            exit(0); // Use exit(0) to close the app
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0.2),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: containerWidth,
                height: 150,
                margin: EdgeInsets.symmetric(
                    horizontal: (screenWidth - containerWidth) / 2,
                    vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Upload Image',
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    MaterialButton(
                      onPressed: () {
                        showImagePickerDialog(context, (imagePath) {
                          setState(() {
                            _selectedImagePath =
                                imagePath; // Update the selected image file path
                          });
                        });
                      },
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Choose from device',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: _selectedImagePath
                        .isNotEmpty // Check if an image is selected
                    ? Image.file(
                        File(_selectedImagePath),
                        fit: BoxFit.cover, // Image fills the container width
                      )
                    : const Center(
                        child: Text(
                          '',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
