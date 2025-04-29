import 'dart:io' as io;
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraImagePicker extends StatefulWidget {
  const CameraImagePicker({super.key});

  @override
  State<CameraImagePicker> createState() => _CameraImagePickerState();
}

class _CameraImagePickerState extends State<CameraImagePicker> {
  io.File? _imageFile;
  Uint8List? _webImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      if (kIsWeb) {
        // For Flutter Web
        final bytes = await pickedFile.readAsBytes();
        setState(() {
          _webImage = bytes;
        });
      } else {
        // For Mobile
        setState(() {
          _imageFile = io.File(pickedFile.path);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (kIsWeb && _webImage != null) {
      imageWidget = Image.memory(_webImage!);
    } else if (_imageFile != null) {
      imageWidget = Image.file(_imageFile!);
    } else {
      imageWidget = const Text('No image picked');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker in Flutter'),
      ),
      body: Center(child: imageWidget),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
