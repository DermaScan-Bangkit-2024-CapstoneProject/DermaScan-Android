import 'package:dermascan/app/services/auth_service.dart';
import 'package:dermascan/app/services/dio.dart';
import 'package:dermascan/app/ui/themes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';

late SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioClient().init();
  prefs = await SharedPreferences.getInstance();
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      title: "DermaScan",
      initialRoute: AppPages.INITIAL,
      initialBinding: BindingsBuilder.put(() => AuthService()),
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
    ),
  );
}
