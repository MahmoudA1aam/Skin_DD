import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:skin_dd/features/auth/data/auth_service/auht_service.dart';
import 'package:skin_dd/features/auth/data/models/login_model.dart';
import 'package:skin_dd/features/auth/data/models/sign_up_model.dart';

import '../../../../core/errors/failures.dart';

class AuthRepo {
  final AuhtService auhtService;

  AuthRepo({required this.auhtService});
  Future<Either<Failure, LoginModel>> login({
    required LoginModel loginModel,
  }) async {
    try {
      var resulte = await auhtService.login(loginModel: loginModel);
      return resulte.fold(
        (failure) => Left(SeverFailure(failure.message)),
        (response) => Right(response),
      );
    } on Exception catch (e) {
      log("AuthRepo ----- Login ${e.toString()}");
      return Left(SeverFailure(e.toString()));
    }
  }

  Future<Either<Failure, SignUpModel>> signUp({
    required SignUpModel signUpModel,
  }) async {
    try {
      var resulte = await auhtService.signUp(signupModel: signUpModel);
      return resulte.fold(
        (failure) => Left(SeverFailure(failure.message)),
        (response) => Right(response),
      );
    } on Exception catch (e) {
      log("AuthRepo ----- signUp ${e.toString()}");
      return Left(SeverFailure(e.toString()));
    }
  }
}
