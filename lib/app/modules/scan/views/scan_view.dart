import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/scan_controller.dart';

class ScanView extends GetView<ScanController> {
  final ScanController scanController = Get.put(ScanController());

  const ScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload Photo")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => scanController.selectedImage.value != null
                  ? Image.file(
                      scanController.selectedImage.value!,
                      height: 200,
                    )
                  : Text("No image selected."),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: scanController.pickFromGallery,
                  icon: Icon(Icons.photo),
                  label: Text("Gallery"),
                ),
                ElevatedButton.icon(
                  onPressed: scanController.pickFromCamera,
                  icon: Icon(Icons.camera_alt),
                  label: Text("Camera"),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: scanController.uploadImage,
              child: Text("Upload Image"),
            ),
          ],
        ),
      ),
    );
  }
}
