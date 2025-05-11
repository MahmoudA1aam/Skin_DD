import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_dd/core/data/models/delete_diagnosis_model.dart';
import 'package:skin_dd/core/services/get_it/get_it.dart';
import 'package:skin_dd/core/widgets/custom_app_bar.dart';

import 'package:skin_dd/features/details/presentation/widgets/details_view_body.dart';
import 'package:skin_dd/features/home/presentation/cubits/home_cubit.dart';

import '../../../../core/data/models/get_diagnosis_model.dart';
import '../../../../core/data/repos/diagnosis_repo.dart';
import '../../../scanner/presentation/cubits/scanner_cubit.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.getItemDiagnosisModel});
  final GetItemDiagnosisModel getItemDiagnosisModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Details",
        isVisible: true,
        context: context,
        isVisibleAction: true,
        onPressed: () {
          DeleteDiagnosisModel userId = DeleteDiagnosisModel(
            userid: getItemDiagnosisModel.userid!,
          );
          context.read<ScannerCubit>().deleteDiagnosis(
            diagonoseId: getItemDiagnosisModel.diagnosisId!,
            userId: userId,
          );
        },
      ),
      body: SafeArea(child: DetailsViewBody(reposne: getItemDiagnosisModel)),
    );
  }
}
