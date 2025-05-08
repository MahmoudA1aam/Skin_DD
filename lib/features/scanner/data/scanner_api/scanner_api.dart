import 'package:camera/camera.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:skin_dd/core/constans/api_constants.dart';
import 'package:skin_dd/core/errors/custom_exception.dart';
import 'package:skin_dd/features/scanner/data/models/xception_response_model.dart';

import '../../../../core/errors/failures.dart';

class ScnnerApi {
  final Dio dio;
  ScnnerApi({required this.dio});
  Future<Either<Failure, XceptionResponseModel>> uploadImage({
    required XFile image,
  }) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      try {
        String fileExtension = image.path.split('.').last.toLowerCase();
        if (!['jpg', 'jpeg', 'png'].contains(fileExtension)) {
          return Left(
            SeverFailure("Unsupported image format. Please use JPG or PNG."),
          );
        }
        FormData data = FormData.fromMap({
          'file': await MultipartFile.fromFile(
            image.path,
            filename: image.path.split('/').last,
          ),
        });
        var response = await dio.post(
          ApiConstants.baseUrl,
          data: data,
          options: Options(
            validateStatus: (status) {
              return status! < 500; // قبول الحالات أقل من 500 لمعالجة الأخطاء
            },
          ),
        );

        XceptionResponseModel xceptionResponseModel =
            XceptionResponseModel.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(xceptionResponseModel);
        } else {
          return Left(
            SeverFailure(
              response.data['message'] == 'Image quality check failed'
                  ? "Image quality check failed"
                  : '',
            ),
          );
        }
      } on DioException catch (e) {
        if (e.type == DioExceptionType.connectionTimeout) {
          return Left(SeverFailure("Connection time out"));
        } else if (e.type == DioExceptionType.receiveTimeout) {
          return Left(SeverFailure("Connection time out"));
        } else if (e.type == DioExceptionType.badCertificate) {
          return Left(SeverFailure("Bad certificate"));
        } else if (e.type == DioExceptionType.badResponse) {
          return Left(SeverFailure(e.response!.data['message']));
        } else {
          return Left(SeverFailure(e.message.toString()));
        }
      }
    } else {
      return Left(SeverFailure("Check internet connection"));
    }
  }
}
