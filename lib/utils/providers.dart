import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter/utils/di.dart';

import '../features/Login/presentation/bloc/login_bloc.dart';

class Providers {
  static getProviders() {
    return [
      BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(apiServices: getIt.call()),
      ),
    ];
  }
}
