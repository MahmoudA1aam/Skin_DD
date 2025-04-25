part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginModel loginModel;

  LoginSuccess({required this.loginModel});
}

class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure({required this.errorMessage});
}

class LoginLoading extends LoginState {}
