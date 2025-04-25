import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:skin_dd/features/scanner/data/api_manager/api_manager.dart';
import 'package:skin_dd/features/scanner/data/repos/scanner_repo.dart';
import 'package:skin_dd/features/scanner/presentation/cubits/scanner_cubit.dart';

import '../../helper/api_helper/dio_factory.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  Dio dio = DioFactory.getDio();
  getIt.registerSingleton<ApiManager>(ApiManager(dio: dio));
  getIt.registerSingleton<ScannerRepo>(
    ScannerRepo(apiManager: getIt.get<ApiManager>()),
  );
  getIt.registerSingleton<ScannerCubit>(
    ScannerCubit(scannerRepo: getIt.get<ScannerRepo>()),
  );
}
