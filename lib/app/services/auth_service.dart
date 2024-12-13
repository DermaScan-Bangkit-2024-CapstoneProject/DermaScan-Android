import 'package:dermascan/app/common/constants.dart';
import 'package:dermascan/app/data/login.dart';
import 'package:dermascan/app/data/user.dart';
import 'package:dermascan/app/routes/app_pages.dart';
import 'package:dermascan/app/services/dio.dart';
import 'package:dermascan/main.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/logger.dart';

class AuthService extends GetxService {
  var isLoggedIn = false;
  final box = GetStorage();

  @override
  void onInit() async {
    isLoggedIn = getToken() != null;
    super.onInit();
  }

  String? getToken() {
    final String? token = prefs?.getString(Constants.TOKEN_KEY);
    return token;
  }

  Future<void> login(String email, String password) async {
    try {
      var response = await apiService
          .post("/auth/login", data: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        var loginData = Login.fromJson(response.data);
        prefs?.setString(Constants.TOKEN_KEY, loginData.token);
        isLoggedIn = true;
        await box.write('user', loginData.user.toMap());
        Get.offAllNamed(Routes.HOME);
      }
    } on DioException catch (e) {
      logger.e(e);
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> signup(String name, String email, String password,
      {int age = 18,
      String phone = '+123456789',
      String city = 'Jakarta',
      String country = 'Indonesia'}) async {
    try {
      var response = await apiService.post("/auth/signup", data: {
        'name': name,
        'age': age,
        'email': email,
        'password': password,
        'phone': phone,
        'city': city,
        'country': country
      });

      if (response.statusCode == 201) {
        Get.snackbar("Success", "Account created successfully! Redirecting to Login");
        await Future.delayed(Duration(seconds: 2));
        Get.offAllNamed(Routes.LOGIN);
      }
    } on DioException catch (e) {
      Get.snackbar("Sign up failed", e.response?.data["errors"]);
    } catch (e) {
      logger.e(e);
    }
  }

  Future<User?> getUser() async {
    try {
      var userMap = box.read<Map<String, dynamic>>('user');
      if (userMap != null) {
        var user = userFromJson(userMap.toString());
        return user;
      }
    } catch (e) {
      logger.e(e);
    }
    return null;
  }

  Future<bool> logout() async {
    Future<void> signOut() async {
      await prefs?.remove(Constants.TOKEN_KEY);
      await box.erase();
      isLoggedIn = false;
      Get.offAllNamed(Routes.LOGIN);
    }

    try {
      final token = prefs?.getString(Constants.TOKEN_KEY);
      if (token != null) {
        await apiServiceWithToken.post(
          "/auth/logout",
        );
      }
      await signOut();
      return true;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        await signOut();
        return true;
      } else {
        logger.e(e);
        return false;
      }
    } catch (e) {
      logger.e(e);
      return false;
    }
  }
}
