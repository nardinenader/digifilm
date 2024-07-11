import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class filmScan extends StatefulWidget {
  final int initialIndex;

  const filmScan({super.key, required this.initialIndex});

  @override
  State<filmScan> createState() => _filmScanState();
}

class _filmScanState extends State<filmScan> {
  final ImagePicker _picker = ImagePicker();
  File? _image;

  @override
  void initState() {
    super.initState();
    _openCamera();
  }

  Future<void> _openCamera() async {
    final PickedFile? pickedFile = await _picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _chooseFromGallery() async {
    final PickedFile? pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: _image == null
                ? Text('No image selected.')
                : Image.file(_image!),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: FloatingActionButton(
              onPressed: _chooseFromGallery,
              child: Icon(Icons.photo_library),
            ),
          ),
        ],
      ),
    );
  }
}
