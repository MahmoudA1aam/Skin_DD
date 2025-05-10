import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_dd/core/services/get_it/get_it.dart';
import 'package:skin_dd/features/scanner/data/repos/scanner_repo.dart';
import 'package:skin_dd/features/scanner/presentation/widgets/scanner_view_body.dart';

import '../../../../core/data/repos/diagnosis_repo.dart';
import '../cubits/scanner_cubit.dart';

class ScannerView extends StatelessWidget {
  const ScannerView({super.key, required this.cameras});
  final List<CameraDescription> cameras;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: BlocProvider(
        create:
            (context) => ScannerCubit(
              scannerRepo: getIt.get<ScannerRepo>(),
              diagnosisRepo: getIt.get<DiagnosisRepo>(),
            ),
        child: ScannerViewBody(cameras: cameras),
      ),
    );
  }
}
