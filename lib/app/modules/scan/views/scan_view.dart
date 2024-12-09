import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/scan_controller.dart';

class ScanView extends GetView<ScanController> {
  final ScanController scanController = Get.put(ScanController());

  ScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() {
            if (scanController.isInitialized.value) {
             return LayoutBuilder(
                builder: (context, constraints) {
                  return SizedBox(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    child: CameraPreview(scanController.cameraController!),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
          Center(
            child: Container(
              width: 250,
              height: 350,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.4),
                  ],
                ),
              ),
            ),
          ),
          ],
      ),

      // BottomAppBar
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.photo_library,
                    color: Theme.of(context).primaryColor),
                onPressed: () async {
                  controller.pickImageFromGallery();
                },
              ),
              SizedBox(width: 40), // Spasi untuk FAB
              IconButton(
                icon: Icon(
                  scanController.cameraController?.value.flashMode ==
                          FlashMode.off
                      ? Icons.flash_off
                      : Icons.flash_on,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  scanController.toggleFlash();
                },
              )
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          scanController.takePicture();
        },
        child: Icon(
          Icons.camera_alt,
          color: Theme.of(context).secondaryHeaderColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
