import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:starter/shared_models/api_response.dart';

part 'api_services.g.dart';

@RestApi()
abstract class AuthServices {
  factory AuthServices(Dio dio, {String baseUrl}) = _AuthServices;

  @POST('/auth/login')
  Future<ApiResponse> login(@Body() Map<String, dynamic> body);
}
