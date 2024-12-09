import 'package:get/get.dart';

import '../../../services/auth_service.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  final authService = Get.find<AuthService>();

  void login(String email, password) async {
    isLoading(true);
    await authService.login(email, password);
    isLoading(false);
  }
}
