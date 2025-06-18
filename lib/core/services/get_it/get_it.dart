import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:skin_dd/core/data/networking/api_manger.dart';
import 'package:skin_dd/core/data/repos/diagnosis_repo.dart';
import 'package:skin_dd/features/auth/data/repos/auth_repo.dart';
import 'package:skin_dd/features/auth/presentation/login/cubits/login_cubit.dart';
import 'package:skin_dd/features/auth/presentation/sign_up/cubits/sign_up_cubit.dart';

import 'package:skin_dd/features/scanner/data/scanner_api/scanner_api.dart';
import 'package:skin_dd/features/scanner/data/repos/scanner_repo.dart';
import 'package:skin_dd/features/scanner/presentation/cubits/scanner_cubit.dart';

import '../../../features/auth/data/auth_service/auht_service.dart';

import '../../helper/api_helper/dio_factory.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  Dio dio = DioFactory.getDio();
  getIt.registerSingleton<ScnnerApi>(ScnnerApi(dio: dio));
  getIt.registerSingleton<ApiManger>(ApiManger(dio: dio));
  getIt.registerSingleton<ScannerRepo>(
    ScannerRepo(apiManager: getIt.get<ScnnerApi>()),
  );
  getIt.registerSingleton<DiagnosisRepo>(
    DiagnosisRepo(apiManger: getIt.get<ApiManger>()),
  );

  /* getIt.registerSingleton<HomeCubite>(
    HomeCubite(diagnosisRepo: getIt.get<DiagnosisRepo>()),
  );*/
  getIt.registerSingleton<ScannerCubit>(
    ScannerCubit(
      scannerRepo: getIt.get<ScannerRepo>(),
      diagnosisRepo: getIt.get<DiagnosisRepo>(),
    ),
  );
  getIt.registerSingleton<AuhtService>(AuhtServiceImp(dio: dio));
  getIt.registerSingleton<AuthRepo>(
    AuthRepo(auhtService: getIt.get<AuhtService>()),
  );
  getIt.registerSingleton<SignUpCubit>(
    SignUpCubit(authRepo: getIt.get<AuthRepo>()),
  );
  getIt.registerSingleton<LoginCubit>(
    LoginCubit(authRepo: getIt.get<AuthRepo>()),
  );
}
