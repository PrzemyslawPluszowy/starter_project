import 'package:get_it/get_it.dart';
import 'package:starter/shared/service/api_services.dart';
import 'package:starter/utils/dio_client.dart';

final getIt = GetIt.instance;

initDi() async {
  getIt.registerLazySingleton<AuthServices>(
      () => AuthServices(buildDioClient()));
}
