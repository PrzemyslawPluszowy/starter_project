import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter/features/starer_page/ui/cubit/start_slider_cubit.dart';
import 'package:starter/utils/di.dart';

import '../features/Login/presentation/bloc/login_bloc.dart';

class Providers {
  static getProviders() {
    return [
      BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(apiServices: getIt.call()),
      ),
      BlocProvider<StarterPageCubit>(
        create: (context) => StarterPageCubit(),
      ),
    ];
  }
}
