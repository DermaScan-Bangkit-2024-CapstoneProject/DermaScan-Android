import 'package:dermascan/app/common/constants.dart';
import 'package:dermascan/main.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final apiService = DioClient().dio;
final apiServiceWithToken = DioClient().dioWithToken();

class DioClient {
  DioClient._privateConstructor();

  static final DioClient _instance = DioClient._privateConstructor();

  factory DioClient() => _instance;

  final Dio dio = Dio();

  void init() {
    dio.options.baseUrl = Constants.apiUrl;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.interceptors.add(PrettyDioLogger(requestBody: true, requestHeader: true, responseHeader: true));
  }

  Dio dioWithToken() {
    final token = prefs?.getString(Constants.TOKEN_KEY);
    dio.options.headers['Authorization'] = 'Bearer $token';
    return dio;
  }
}
