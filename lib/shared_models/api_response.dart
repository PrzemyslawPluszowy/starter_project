import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse {
  final int? statusCode;
  final dynamic message;
  final String? error;
  @JsonKey(name: 'access_token')
  final String? accessToken;

  ApiResponse(
      {required this.message,
      required this.statusCode,
      this.error,
      this.accessToken});

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}
