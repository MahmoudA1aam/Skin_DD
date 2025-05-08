import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:skin_dd/core/errors/failures.dart';
import 'package:skin_dd/features/auth/data/models/login_model/login_request_model.dart';
import 'package:skin_dd/features/auth/data/models/sign_up_model/sign_up_request_model.dart';
import 'package:skin_dd/features/auth/data/models/sign_up_model/sign_up_response_model.dart';

import '../../../../core/constans/api_constants.dart';
import '../models/login_model/login_response_model.dart';

abstract class AuhtService {
  Future<Either<Failure, LoginResponseModel>> login({
    required LoginRequestModel loginrequestModel,
  });
  Future<Either<Failure, SignUpResponseModel>> signUp({
    required SignUpRequestModel signuprequestModel,
  });
}

class AuhtServiceImp implements AuhtService {
  final Dio dio;
  AuhtServiceImp({required this.dio});
  @override
  Future<Either<Failure, LoginResponseModel>> login({
    required LoginRequestModel loginrequestModel,
  }) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var response = await dio.post(
        ApiConstants.login,
        data: loginrequestModel.toJson(),
      );
      LoginResponseModel responseData = LoginResponseModel.fromJson(
        response.data,
      );

      print("statusCode=${response.statusCode}");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        print("sucess");
        return Right(responseData);
      } else {
        print("error message");
        return Left(SeverFailure(responseData.message.toString()));
      }
    } else {
      print("no interNet");
      return Left(SeverFailure("Check internet connection"));
    }
  }

  @override
  Future<Either<Failure, SignUpResponseModel>> signUp({
    required SignUpRequestModel signuprequestModel,
  }) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var response = await dio.post(
        ApiConstants.register,
        data: signuprequestModel.toJson(),
      );
      SignUpResponseModel responseData = SignUpResponseModel.fromJson(
        response.data,
      );

      print("statusCode=${response.statusCode}");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        print("sucess");
        return Right(responseData);
      } else {
        print("error message");
        return Left(SeverFailure(responseData.message.toString()));
      }
    } else {
      print("no interNet");
      return Left(SeverFailure("Check internet connection"));
    }
  }
}
