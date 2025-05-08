import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skin_dd/features/auth/data/models/login_model/login_request_model.dart';
import 'package:skin_dd/features/auth/data/repos/auth_repo.dart';

import '../../../data/models/login_model/login_response_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit({required this.authRepo}) : super(LoginInitial());

  Future<void> login({required LoginRequestModel loginModel}) async {
    var result = await authRepo.login(loginrequestModel: loginModel);
    emit(LoginLoading());
    result.fold(
      (failure) => emit(LoginFailure(errorMessage: failure.message)),
      (response) => emit(LoginSuccess(loginModel: response)),
    );
  }
}
