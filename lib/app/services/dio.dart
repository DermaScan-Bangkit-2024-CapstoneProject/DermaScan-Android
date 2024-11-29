import 'package:dermascan/app/common/constants.dart';
import 'package:dio/dio.dart';

class DioClient {
  DioClient._privateConstructor();
  static final DioClient _instance = DioClient._privateConstructor();
  factory DioClient() => _instance;

  final Dio dio = Dio();

  void init() {
    dio.options.baseUrl = Constants.apiUrl;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.interceptors.add(LogInterceptor());
  }
}
