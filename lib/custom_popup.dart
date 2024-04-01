import 'package:flutter/material.dart';

class CustomPopup extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback onSelect;
  final VoidCallback onButton1Pressed;
  final VoidCallback onButton2Pressed;
  final VoidCallback onButton3Pressed;
  final VoidCallback onButton4Pressed;
  final VoidCallback onButton5Pressed;

  const CustomPopup({
    super.key,
    required this.onClose,
    required this.onSelect,
    required this.onButton1Pressed,
    required this.onButton2Pressed,
    required this.onButton3Pressed,
    required this.onButton4Pressed,
    required this.onButton5Pressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double popupWidth = screenWidth * 0.95; // 95% of screen width

    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: onClose,
              ),
            ],
          ),
          const Text(
            'Uploaded Image',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: popupWidth,
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: onButton1Pressed,
                  style: ElevatedButton.styleFrom(
                    // padding: EdgeInsets.zero,
                    minimumSize: const Size(2, 2), // Set minimum size to 2x2
                  ),
                  child: const Text('Original'),
                ),
                GestureDetector(
                  onTap: onButton2Pressed,
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: Image.asset(
                      'asset/user_image_frame_1.png',
                      fit: BoxFit.fill, // Fill the entire button area
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onButton3Pressed,
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: Image.asset(
                      'asset/user_image_frame_2.png',
                      fit: BoxFit.fill, // Fill the entire button area
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onButton4Pressed,
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: Image.asset(
                      'asset/user_image_frame_3.png',
                      fit: BoxFit.fill, // Fill the entire button area
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onButton5Pressed,
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: Image.asset(
                      'asset/user_image_frame_4.png',
                      fit: BoxFit.fill, // Fill the entire button area
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: popupWidth,
            child: ElevatedButton(
              onPressed: onSelect,
              child: const Text('Use this image'),
            ),
          ),
        ],
      ),
    );
  }
}
