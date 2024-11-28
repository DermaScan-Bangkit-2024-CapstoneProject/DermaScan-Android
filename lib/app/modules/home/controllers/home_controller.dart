import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;

  // Update the current bottom navigation index
  void updateIndex(int index) {
    currentIndex.value = index;
  }
}
