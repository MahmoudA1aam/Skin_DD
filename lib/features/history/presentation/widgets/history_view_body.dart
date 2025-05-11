import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_dd/core/theming/colors_app.dart';
import 'package:skin_dd/features/scanner/presentation/cubits/scanner_cubit.dart';

import '../../../../core/helper/routes/routes_name.dart';
import 'history_item.dart';

class HistoryViewBody extends StatelessWidget {
  const HistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, right: 16, left: 16),
        child: BlocBuilder<ScannerCubit, ScannerState>(
          builder: (context, state) {
            if (state is HomeCubiteSuccess) {
              return Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: state.getListDiagnosis.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,

                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoutesName.detailsView,
                          arguments: state.getListDiagnosis[index],
                        );
                      },
                      child: HistoryItem(
                        diagnosisItemModel: state.getListDiagnosis[index],
                      ),
                    );
                  },
                ),
              );
            }
            if (state is HomeCubiteFailure) {
              return SliverToBoxAdapter(
                child: Center(child: Text(state.message)),
              );
            }
            return Center(
              child: CircularProgressIndicator(color: ColorsApp.primaryColor),
            );
          },
        ),
      ),
    );
  }
}
