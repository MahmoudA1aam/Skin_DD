import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skin_dd/features/auth/data/repos/auth_repo.dart';

import '../../../data/models/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit({required this.authRepo}) : super(LoginInitial());

  Future<void> login({required LoginModel loginModel}) async {
    var result = await authRepo.login(loginModel: loginModel);
    emit(LoginLoading());
    result.fold(
      (failure) => emit(LoginFailure(errorMessage: failure.message)),
      (response) => emit(LoginSuccess(loginModel: response)),
    );
  }
}
