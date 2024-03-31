import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => MyHomePage(
                title: 'Add Image/Icon',
                navigateToUploadPopup: (imagePath) {
                  // Handle navigateToUploadPopup action here
                },
              ),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => MyHomePage(
                title: 'Add Image/Icon',
                navigateToUploadPopup: (imagePath) {
                  // Handle navigateToUploadPopup action here
                },
              ),
            );
        }
      },
    );
  }
}
