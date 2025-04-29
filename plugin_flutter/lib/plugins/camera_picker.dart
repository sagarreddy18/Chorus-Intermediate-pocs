import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraCaptureWeb extends StatefulWidget {
  const CameraCaptureWeb({super.key});

  @override
  CameraCaptureWebState createState() => CameraCaptureWebState();
}

class CameraCaptureWebState extends State<CameraCaptureWeb> {
  Uint8List? _imageBytes;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
    );

    if (pickedImage != null) {
      final bytes = await pickedImage.readAsBytes();
      setState(() {
        _imageBytes = bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Take Picture - Web')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imageBytes != null
                ? Image.memory(_imageBytes!, height: 300)
                : Text("No image selected"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text("Take Picture"),
            ),
          ],
        ),
      ),
    );
  }
}
