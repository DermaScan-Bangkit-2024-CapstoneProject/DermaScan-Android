import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/preview_controller.dart';

class PreviewView extends GetView<PreviewController> {
  const PreviewView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PreviewView'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.file(
              File(controller.imagePath),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              controller.uploadImage();
            },
            child: Text('Upload Image'),
          ),
        ],
      ),
    );
  }
}
