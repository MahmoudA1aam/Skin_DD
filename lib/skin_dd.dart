import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:skin_dd/core/constans/shared_pref_constans.dart';
import 'package:skin_dd/core/data/repos/diagnosis_repo.dart';
import 'package:skin_dd/core/helper/routes/ongenerate_routes.dart';
import 'package:skin_dd/core/helper/routes/routes_name.dart';
import 'package:skin_dd/core/helper/shared_pref_helper/shared_pref.dart';
import 'package:skin_dd/core/services/get_it/get_it.dart';

import 'package:skin_dd/features/scanner/data/repos/scanner_repo.dart';
import 'package:skin_dd/features/scanner/presentation/cubits/scanner_cubit.dart';



class SkinDd extends StatefulWidget {
  const SkinDd({super.key});

  @override
  State<SkinDd> createState() => _SkinDdState();
}

class _SkinDdState extends State<SkinDd> {
  String userId = '';
  @override
  initState() {
    super.initState();
    userId =
        SharedPreferencesHelper.getDate(
          key: SharedPrefConstans.userId,
        ).toString();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ScannerCubit(
            diagnosisRepo: getIt.get<DiagnosisRepo>(),
            scannerRepo: getIt.get<ScannerRepo>(),
          )..geAlltDiagnosis(userId: userId),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoutes,
        initialRoute:
            isonboadingseen
                ? isAccessToken
                    ? RoutesName.homeView
                    : RoutesName.loginView
                : RoutesName.onBoardingView,
        builder: EasyLoading.init(builder: BotToastInit()),
      ),
    );
  }
}
