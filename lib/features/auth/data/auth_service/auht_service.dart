import 'package:dartz/dartz.dart';
import 'package:skin_dd/core/errors/failures.dart';
import 'package:skin_dd/features/auth/data/models/login_model.dart';
import 'package:skin_dd/features/auth/data/models/sign_up_model.dart';

abstract class AuhtService {
  Future<Either<Failure, LoginModel>> login({required LoginModel loginModel});
  Future<Either<Failure, SignUpModel>> signUp({
    required SignUpModel signupModel,
  });
}
