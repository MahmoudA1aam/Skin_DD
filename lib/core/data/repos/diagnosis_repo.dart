import 'package:dartz/dartz.dart';
import 'package:skin_dd/core/data/models/delete_diagnosis_model.dart';
import 'package:skin_dd/core/data/models/diagnosis_response_model.dart';
import 'package:skin_dd/core/data/models/get_diagnosis_model.dart';
import 'package:skin_dd/core/data/networking/api_manger.dart';
import 'package:skin_dd/core/errors/failures.dart';

import '../models/diagnosis_model.dart';

class DiagnosisRepo {
  final ApiManger apiManger;
  DiagnosisRepo({required this.apiManger});
  Future<Either<Failure, DiagnosisResponseModel>> sendDiagnosis({
    required DiagnosisModel diagnosisModel,
  }) async {
    final resulte = await apiManger.sendDiagnosis(
      diagnosisModel: diagnosisModel,
    );
    return resulte.fold(
      (failure) => Left(SeverFailure(failure.message)),
      (response) => Right(response),
    );
  }

  Future<Either<Failure, GetDiagnosisModel>> getDiagnosis({
    required String userId,
  }) async {
    final resulte = await apiManger.getDiagnosis(userId: userId);
    return resulte.fold(
      (failure) => Left(SeverFailure(failure.message)),
      (response) => Right(response),
    );
  }

  Future<Either<Failure, DeleteDiagnosisResponseModel>> deleteDiagnosis({
    required DeleteDiagnosisModel userId,
    required String diagonoseId,
  }) async {
    final resulte = await apiManger.deleteDiagnosis(
      userId: userId,
      diagonoseId: diagonoseId,
    );
    return resulte.fold(
      (failure) => Left(SeverFailure(failure.message)),
      (response) => Right(response),
    );
  }
}
