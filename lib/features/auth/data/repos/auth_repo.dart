import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:skin_dd/features/auth/data/auth_service/auht_service.dart';
import 'package:skin_dd/features/auth/data/models/sign_up_model/sign_up_response_model.dart';

import '../../../../core/errors/failures.dart';
import '../models/login_model/login_request_model.dart';
import '../models/login_model/login_response_model.dart';
import '../models/sign_up_model/sign_up_request_model.dart';

class AuthRepo {
  final AuhtService auhtService;

  AuthRepo({required this.auhtService});
  Future<Either<Failure, LoginResponseModel>> login({
    required LoginRequestModel loginrequestModel,
  }) async {
    try {
      var resulte = await auhtService.login(
        loginrequestModel: loginrequestModel,
      );
      return resulte.fold(
        (failure) => Left(SeverFailure(failure.message)),
        (response) => Right(response),
      );
    } on Exception catch (e) {
      log("AuthRepo ----- Login ${e.toString()}");
      return Left(SeverFailure(e.toString()));
    }
  }

  Future<Either<Failure, SignUpResponseModel>> signUp({
    required SignUpRequestModel signupRequestModel,
  }) async {
    try {
      var resulte = await auhtService.signUp(
        signuprequestModel: signupRequestModel,
      );
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
