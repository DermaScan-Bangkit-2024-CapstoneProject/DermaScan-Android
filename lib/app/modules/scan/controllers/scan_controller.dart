import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ScanController extends GetxController {
  var selectedImage = Rx<File?>(null);

  final ImagePicker picker = ImagePicker();

  // Pick image from the gallery
  Future<void> pickFromGallery() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    _setImage(image);
  }

  // Take photo from the camera
  Future<void> pickFromCamera() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    _setImage(image);
  }

  // Common method to set the image
  void _setImage(XFile? image) {
    if (image != null) {
      selectedImage(File(image.path));
    } else {
      Get.snackbar("Error", "No image selected.");
    }
  }

  // Simulate image upload
  Future<void> uploadImage() async {
    if (selectedImage.value == null) {
      Get.snackbar("Error", "Please select an image first.");
      return;
    }

    try {
      Get.snackbar("Uploading", "Image upload in progress...");
      await Future.delayed(Duration(seconds: 2)); // Simulating upload process
      Get.snackbar("Success", "Image uploaded successfully!");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }




}
