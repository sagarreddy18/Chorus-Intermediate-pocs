
import 'package:plugin_flutter/plugins/image_picker.dart';
import 'package:flutter/material.dart';



void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: CameraImagePicker()
      //     home: HomePage()
        home: CameraImagePicker()
    );
  }
}

