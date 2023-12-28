part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.logedIn() = _LogedIn;
  const factory LoginState.logedOut() = _LogedOut;
  const factory LoginState.error() = _Error;
}
