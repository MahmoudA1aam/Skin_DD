part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpFailure extends SignUpState {
  final String message;
  SignUpFailure({required this.message});
}

class SignUpSuccess extends SignUpState {
  final SignUpModel signUpModel;
  SignUpSuccess({required this.signUpModel});
}

class SignUpLoading extends SignUpState {}
