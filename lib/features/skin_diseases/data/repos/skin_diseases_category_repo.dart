import 'package:dartz/dartz.dart';
import 'package:skin_dd/core/data/networking/api_manger.dart';
import 'package:skin_dd/features/skin_diseases/data/models/skin_disease_category_model.dart';

import '../../../../core/errors/failures.dart';

class SkinDiseasesCategoryRepo {
  final ApiManger apiManger;

  SkinDiseasesCategoryRepo({required this.apiManger});

  Future<Either<Failure, SkinDiseaseCategoryModel>> getSkinDiseases() async {
    final response = await apiManger.getDiseaseCategory();
    return response.fold(
      (l) => Left(SeverFailure(l.message)),
      (response) => Right(response),
    );
  }
}
