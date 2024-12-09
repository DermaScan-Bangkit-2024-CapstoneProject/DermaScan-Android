import 'package:dermascan/app/common/constants.dart';
import 'package:dermascan/app/routes/app_pages.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart' show Dio;
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../utils/logger.dart';

class PreviewController extends GetxController {
  final imagePath = Get.arguments["path"];
  final Dio _dio = Dio();

  @override
  void onInit() {
    super.onInit();
    _dio.interceptors.add(PrettyDioLogger());
  }


  Future<void> uploadImage() async {
    try {
      Get.snackbar("Uploading", "Image upload in progress...");

      String fileName = basename(imagePath);
      logger.i("Uploading image: $imagePath");
      dio.FormData formData = dio.FormData.fromMap({
        "file": await dio.MultipartFile.fromFile(
          imagePath,
          filename: fileName,
          contentType: dio.DioMediaType('image', 'jpg'),
        ),
      });

      var response = await _dio.post(
        Constants.predictUrl,
        data: formData,
      );

      if (response.statusCode == 200) {
        Get.snackbar("Success", "Image uploaded successfully!");
        Get.toNamed(Routes.RESULT, arguments: {"response": response.data});
      } else {
        Get.snackbar(
            "Error", "Image upload failed with status: ${response.statusCode}");
      }
    } on dio.DioException catch (e) {
      logger.e(e.message);
    }
  }

}
