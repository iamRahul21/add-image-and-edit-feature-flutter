import 'package:flutter/material.dart';

class CustomPopup extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback onSelect;

  const CustomPopup({
    super.key,
    required this.onClose,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
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
            width: double.infinity,
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
