import 'package:dermascan/app/services/auth_service.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final authService = Get.find<AuthService>();

  final count = 0.obs;

  Future<void> logOut() async {
    await authService.logout();
  }
}
