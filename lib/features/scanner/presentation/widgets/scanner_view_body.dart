import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:skin_dd/core/helper/routes/routes_name.dart';

import 'package:skin_dd/features/scanner/presentation/cubits/scanner_cubit.dart';
import 'package:skin_dd/features/scanner/presentation/widgets/scanner_view_body_bloc_consumer.dart';

class ScannerViewBody extends StatelessWidget {
  const ScannerViewBody({super.key, required this.cameras});
  final List<CameraDescription> cameras;

  @override
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);

    return SafeArea(
      child: BlocConsumer<ScannerCubit, ScannerState>(
        listener: (context, state) {
          if (state is GetDiagnosisSuccess) {
            Navigator.pushNamed(
              context,
              RoutesName.detailsView,
              arguments: state.getItemDiagnosisModel,
            );
            context.read<ScannerCubit>().geAlltDiagnosis(
              userId: state.getItemDiagnosisModel.userid!,
            );
          }
          if (state is ScannerFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              ScannerViewBodyBlocConsumer(cameras: cameras),
              if (state is ScannerLoading)
                Container(
                  color: Colors.black54, // خلفية شفافة لتغطية الشاشة
                  child: const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(color: Colors.white),
                        SizedBox(height: 10),
                        Text(
                          'Analyzing image...',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
