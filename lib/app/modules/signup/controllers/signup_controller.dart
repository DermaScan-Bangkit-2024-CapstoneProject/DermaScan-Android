import 'package:get/get.dart';

class SignupController extends GetxController {
  var isLoading = false.obs;

  // Simulate Signup
  Future<void> signup(String email, String password) async {
    try {
      isLoading(true);
      await Future.delayed(Duration(seconds: 2)); // Simulating network call
      Get.snackbar("Success", "Account created successfully!");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }



}
