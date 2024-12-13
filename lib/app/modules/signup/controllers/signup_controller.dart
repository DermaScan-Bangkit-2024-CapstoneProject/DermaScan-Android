import 'package:dermascan/app/services/auth_service.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  var isLoading = false.obs;
  final AuthService authService = Get.find<AuthService>();

  Future<void> signup(String name, String email, String password) async {
    isLoading.value = true;
    await authService.signup(name, email, password);
    isLoading.value = false;
  }
}
