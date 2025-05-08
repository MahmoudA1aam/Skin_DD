import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:skin_dd/features/auth/data/models/sign_up_model/sign_up_request_model.dart';
import 'package:skin_dd/features/auth/data/models/sign_up_model/sign_up_response_model.dart';
import 'package:skin_dd/features/auth/data/repos/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo authRepo;
  SignUpCubit({required this.authRepo}) : super(SignUpInitial());
  Future<void> signUp({required SignUpRequestModel signUpModel}) async {
    emit(SignUpLoading());
    final result = await authRepo.signUp(signupRequestModel: signUpModel);
    result.fold(
      (failure) => emit(SignUpFailure(message: failure.message)),
      (response) => emit(SignUpSuccess(signUpModel: response)),
    );
  }
}
