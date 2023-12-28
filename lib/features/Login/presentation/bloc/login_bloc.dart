import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:starter/shared/service/api_services.dart';
import 'package:starter/shared_models/api_response.dart';
import 'package:starter/utils/constants.dart';
import 'package:talker/talker.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.apiServices}) : super(const _Initial()) {
    on<LoginEvent>((event, emit) async {
      await event.map(
        logIn: (event) async {
          _handleLoginEvent(event, emit);
        },
        logOut: (event) async {
          _handleLogoutEvent(event, emit);
        },
      );
    });
  }

  final ApiServices apiServices;

  void _handleLoginEvent(_LogIn event, Emitter<LoginState> emit) async {
    try {
      ApiResponse res = await apiServices
          .login({'email': event.email, 'password': event.password});
      if (res.statusCode! >= 400) {
        emit(const LoginState.error());
      } else {
        await Hive.box(AppConst.tokenBox).put('token', res.accessToken);
      }
    } catch (e, s) {
      Talker().error(e.toString(), s);
      emit(const LoginState.error());
    }
  }

  void _handleLogoutEvent(_LogOut event, Emitter<LoginState> emit) async {
    try {
      emit(const LoginState.logedOut());
    } catch (e) {
      emit(const LoginState.error());
    }
  }
}
