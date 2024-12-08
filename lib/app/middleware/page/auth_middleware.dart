import 'package:dermascan/app/routes/app_pages.dart';
import 'package:dermascan/app/services/auth_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authService = Get.find<AuthService>();
    return authService.isLoggedIn
        ? null
        : RouteSettings(name: Routes.LOGIN);
  }
}
