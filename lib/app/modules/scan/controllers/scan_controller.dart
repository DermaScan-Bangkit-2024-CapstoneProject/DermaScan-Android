import 'package:camera/camera.dart';
import 'package:dermascan/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' show Dio;

import '../../../utils/logger.dart';

class ScanController extends GetxController {
  CameraController? cameraController;
  var isInitialized = false.obs;
  final Rx<XFile?> imageFile = Rx<XFile?>(null);

  final Dio _dio = Dio();

  @override
  void onInit() {
    super.onInit();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    cameraController = CameraController(
      firstCamera,
      ResolutionPreset.max,
    );

    cameraController!.initialize().then((_) {
      logger.i("Camera initialized");
      isInitialized.value = true;
      update();
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            logger.e("CameraAccessDenied");
            break;
          default:
            logger.e(e.toString());
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    cameraController!.dispose();
    super.dispose();
  }

  Future<void> takePicture() async {
    try {
      final image = await cameraController!.takePicture();
      imageFile.value = image;
      navigateToPreviewPage(imageFile.value!.path);
    } catch (e) {
      Get.snackbar('Error', 'Failed to take picture: $e');
    }
  }

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile.value = pickedFile;
      navigateToPreviewPage(imageFile.value!.path);
    }
  }

  Future<void> toggleFlash() async {
    if (cameraController == null) {
      return;
    }

    final mode = cameraController!.value.flashMode == FlashMode.off
        ? FlashMode.torch
        : FlashMode.off;

    try {
      await cameraController!.setFlashMode(mode);
    } on CameraException catch (e) {
      Get.snackbar(e.description ?? 'Error', e.toString());
      rethrow;
    }
  }

  void navigateToPreviewPage(String imagePath) {
    Get.toNamed(Routes.PREVIEW, arguments: {"path": imagePath});
  }
}
