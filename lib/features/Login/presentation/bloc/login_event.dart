part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.logIn(String email, String password) = _LogIn;
  const factory LoginEvent.logOut() = _LogOut;
}
