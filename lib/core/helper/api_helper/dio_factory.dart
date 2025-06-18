import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../constans/api_constants.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 45);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.baseUrl = ApiConstants.baseUrl
        ..options.validateStatus = (status) => status! < 500;

      addDioInterceptor();
      addDioHeader();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeader() async {
    dio?.options.headers = {"Accept": 'application/json'};
  }

  static void setTokenAfterLogin(String token) {
    dio?.options.headers = {"Authorization": "Bearer $token"};
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
