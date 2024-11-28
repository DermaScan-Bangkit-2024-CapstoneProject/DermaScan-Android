import 'package:dermascan/app/modules/placeholder/views/placeholder_view.dart';
import 'package:dermascan/app/modules/profile/views/profile_view.dart';
import 'package:dermascan/app/modules/scan/views/scan_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController());

  final List<Widget> pages = [
    PlaceholderView("Dashboard"), // Placeholder
    ScanView(), // Upload Photo Page
    ProfileView(), // Profile Page
    PlaceholderView("Settings"), // Placeholder
  ];

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[homeController.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: homeController.currentIndex.value,
          onTap: homeController.updateIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_camera),
              label: "Upload",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
