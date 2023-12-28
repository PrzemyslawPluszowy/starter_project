import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:starter/utils/constants.dart';

Dio buildDioClient() {
  final dio = Dio();
  dio.options = BaseOptions(
    baseUrl: dotenv.env['SERVER_URL']!,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );

  dio.interceptors.addAll([TokenInterceptor(), LogInterceptor()]);

  return dio;
}

class TokenInterceptor extends Interceptor {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? someToken = await Hive.box(AppConst.tokenBox).get('token');
    options.headers['Authorization'] = 'Bearer $someToken';
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Do something with response data
    super.onResponse(response, handler);
  }

  @override
  Future onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // If the error is 401 Unauthorized, log out the user
    if (err.response?.statusCode == 401) {
      // logout();
    }
    super.onError(err, handler);
  }
}
