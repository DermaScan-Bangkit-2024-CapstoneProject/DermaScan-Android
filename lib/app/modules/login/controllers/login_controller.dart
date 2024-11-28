import 'package:dermascan/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  // Simulate Login
  Future<void> login(String email, String password) async {
    try {
      isLoading(true);
      await Future.delayed(Duration(seconds: 2)); // Simulating network call
      Get.snackbar("Success", "Logged in successfully!");
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }



}
