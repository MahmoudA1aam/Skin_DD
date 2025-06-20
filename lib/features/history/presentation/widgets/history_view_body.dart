import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_dd/core/theming/colors_app.dart';
import 'package:skin_dd/features/history/presentation/widgets/list_view_history.dart';
import 'package:skin_dd/features/scanner/presentation/cubits/scanner_cubit.dart';

class HistoryViewBody extends StatelessWidget {
  const HistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 16, left: 16),
      child: BlocBuilder<ScannerCubit, ScannerState>(
        builder: (context, state) {
          if (state is HomeCubiteSuccess) {
            if (state.getListDiagnosis.isEmpty) {
              return Center(child: Text("No History Found"));
            }
            return ListViewHistory(getSkinDesieaseList: state.getListDiagnosis);
          }
          if (state is HomeCubiteFailure) {
            return Center(child: Text(state.message));
          }
          return Center(
            child: CircularProgressIndicator(color: ColorsApp.primaryColor),
          );
        },
      ),
    );
  }
}
