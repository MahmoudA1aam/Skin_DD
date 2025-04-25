import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';
import 'package:skin_dd/features/scanner/data/api_manager/api_manager.dart';
import 'package:skin_dd/features/scanner/data/models/xception_response_model.dart';

import '../../../../core/errors/failures.dart';

class ScannerRepo {
  final ApiManager apiManager;

  ScannerRepo({required this.apiManager});
  Future<Either<Failure, XceptionResponseModel>> uploadImage({
    required XFile image,
  }) async {
    final response = await apiManager.uploadImage(image: image);
    return response.fold(
      (failure) => Left(failure),
      (response) => Right(response),
    );
  }
}
