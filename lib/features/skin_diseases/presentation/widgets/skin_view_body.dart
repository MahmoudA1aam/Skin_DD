import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_dd/features/scanner/presentation/cubits/scanner_cubit.dart';

import 'package:skin_dd/features/skin_diseases/presentation/widgets/skin_diseases_item.dart';

import '../../../../core/helper/routes/routes_name.dart';

class SkinViewBody extends StatelessWidget {
  const SkinViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, right: 16, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.zero,
                itemCount:
                    context.read<ScannerCubit>().listDiseaseCategory.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,

                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap:
                        () => Navigator.pushNamed(
                          context,
                          RoutesName.skinDiseasesdetails,
                          arguments:
                              context
                                  .read<ScannerCubit>()
                                  .listDiseaseCategory[index],
                        ),
                    child: SkinDiseasesItem(
                      skinDiseaseEntity:
                          context
                              .read<ScannerCubit>()
                              .listDiseaseCategory[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
