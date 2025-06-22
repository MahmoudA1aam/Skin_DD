import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:skin_dd/core/constans/api_constants.dart';
import 'package:skin_dd/core/data/models/delete_diagnosis_model.dart';
import 'package:skin_dd/core/data/models/diagnosis_model.dart';
import 'package:skin_dd/core/data/models/get_diagnosis_model.dart';
import 'package:skin_dd/core/errors/failures.dart';
import 'package:skin_dd/features/skin_diseases/data/models/skin_disease_category_model.dart';

import '../models/diagnosis_response_model.dart';

class ApiManger {
  final Dio dio;
  ApiManger({required this.dio});

  Future<Either<Failure, DiagnosisResponseModel>> sendDiagnosis({
    required DiagnosisModel diagnosisModel,
  }) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      try {
        final response = await dio.post(
          ApiConstants.uploaddiagnosisapi,
          data: diagnosisModel.toJson(),
        );

        final responseData = DiagnosisResponseModel.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(responseData);
        } else {
          return Left(SeverFailure(responseData.error ?? "error null"));
        }
      } on Exception catch (e) {
        log("ApiManger ----- sendDiagnosis ${e.toString()}");
        return Left(SeverFailure(e.toString()));
      }
    } else {
      return Left(SeverFailure("Check internet connection"));
    }
  }

  Future<Either<Failure, GetDiagnosisModel>> getDiagnosis({
    required String userId,
  }) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    /*  if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {*/
    try {
      final response = await dio.get(
        "${ApiConstants.getdiagnosisapi}${userId}",
      );

      final responseData = GetDiagnosisModel.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(responseData);
      } else {
        return Left(SeverFailure("not found---404"));
      }
    } on Exception catch (e) {
      log("ApiManger ----- getDiagnosis ${e.toString()}");
      return Left(SeverFailure(e.toString()));
    }
    /* } else {
      return Left(SeverFailure("Check internet connection"));
    }*/
  }

  Future<Either<Failure, DeleteDiagnosisResponseModel>> deleteDiagnosis({
    required DeleteDiagnosisModel userId,
    required String diagonoseId,
  }) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      try {
        final response = await dio.delete(
          "${ApiConstants.deletediagnosisapi}${diagonoseId}",
          data: userId.toJson(),
        );

        final responseData = DeleteDiagnosisResponseModel.fromJson(
          response.data,
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(responseData);
        } else {
          return Left(SeverFailure("failed to delete"));
        }
      } on Exception catch (e) {
        log("ApiManger ----- deleteDiagnosis ${e.toString()}");
        return Left(SeverFailure(e.toString()));
      }
    } else {
      return Left(SeverFailure("Check internet connection"));
    }
  }

  Future<Either<Failure, SkinDiseaseCategoryModel>> getDiseaseCategory() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      try {
        final response = await dio.get(ApiConstants.skindiseasesapi);

        final responseData = SkinDiseaseCategoryModel.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(responseData);
        } else {
          return Left(SeverFailure("not found---404"));
        }
      } on Exception catch (e) {
        log("ApiManger ----- getDiagnosis ${e.toString()}");
        return Left(SeverFailure(e.toString()));
      }
    } else {
      return Left(SeverFailure("Check internet connection"));
    }
  }
}
