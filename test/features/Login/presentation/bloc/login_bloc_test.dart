import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:starter/features/Login/presentation/bloc/login_bloc.dart';
import 'package:starter/shared/service/api_services.dart';
import 'package:starter/shared_models/api_response.dart';
import 'package:starter/utils/constants.dart';

import '../../../../shared/service/api_services_test.mocks.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class MockHiveBox extends Mock implements Box {}

class MockHiveInterface extends Mock implements HiveInterface {}

@GenerateMocks([
  AuthServices,
])
void main() async {
  final apiServices = MockAuthServices();
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(AppConst.tokenBox);

  group('LoginBloc', () {
    blocTest<LoginBloc, LoginState>(
      'emits [LoginState.error()] when login fails',
      build: () => LoginBloc(apiServices: apiServices),
      act: (bloc) async {
        when(apiServices.login(any)).thenAnswer((_) async => ApiResponse(
            statusCode: 400, message: '')); // Symulacja nieudanego logowania
        bloc.add(const LoginEvent.logIn('test', 'test'));
        await bloc.close();
      },
      expect: () => const [LoginState.error()],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [] when logout is requested',
      build: () => LoginBloc(apiServices: apiServices),
      act: (bloc) async {
        bloc.add(const LoginEvent.logOut());
        await bloc.close();
      },
      expect: () => const [LoginState.logedOut()],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [LoginState.error()] when an exception occurs during login',
      build: () => LoginBloc(apiServices: apiServices),
      act: (bloc) async {
        when(apiServices.login(any)).thenThrow(
            Exception('Test Exception')); // Symulacja wyjątku podczas logowania
        bloc.add(const LoginEvent.logIn('test', 'test'));
        await bloc.close();
      },
      expect: () => const [LoginState.error()],
    );
  });
}
