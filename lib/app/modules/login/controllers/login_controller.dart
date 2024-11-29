import 'package:dermascan/app/routes/app_pages.dart';
import 'package:dermascan/app/services/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var http = DioClient().dio;

  late final SharedPreferences _prefs;

  @override
  void onInit() async {
    super.onInit();
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> login(String email, String password) async {
    try {
      isLoading(true);
      var response = await http.post(
        "/auth/login",
        data: {
          'email': email,
          'password': password,
        },
      );

      print(response);
      await _prefs.setString('token', response.data['token']);

      Get.snackbar("Success", "Logged in successfully!");
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
