import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:starter/shared/service/api_services.dart';
import 'package:dio/dio.dart';
import 'package:starter/shared_models/api_response.dart';
import 'api_services_test.mocks.dart';

@GenerateMocks([AuthServices, Dio])
void main() {
  group('Post login', () {
    late MockAuthServices apiServices;

    setUp(() {
      apiServices = MockAuthServices();
    });

    test('Post Error', () async {
      // error response
      final response = Response(
        data: {'message': 'Invalid credentials'},
        statusCode: 401,
        requestOptions: RequestOptions(path: '/auth/login'),
      );

      // Kiedy wywołamy metodę login z ApiServices zwróć odpowiedź z serwera
      when(apiServices.login({"email": "test", "password": "test"}))
          .thenAnswer((_) async => ApiResponse(
                statusCode: response.statusCode,
                message: response.data!['message'],
              ));
      expect(await apiServices.login({"email": "test", "password": "test"}),
          isA<ApiResponse>());
    });
    test("Get token", () async {
      final response = Response(
        data: {'access_token': '12345'},
        statusCode: 200,
        requestOptions: RequestOptions(path: '/auth/login'),
      );
      when(apiServices.login({"email": "test", "password": "test"}))
          .thenAnswer((_) async => ApiResponse(
                message: response.data!['message'],
                statusCode: response.statusCode,
                accessToken: response
                    .data!['access_token'], // Uwaga na poprawienie klucza
              ));

      final apiResponse =
          await apiServices.login({"email": "test", "password": "test"});

      expect(apiResponse.accessToken, '12345');
    });
  });
}
