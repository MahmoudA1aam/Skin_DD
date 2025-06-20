import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skin_dd/features/home/presentation/widgets/list_view_categories.dart';
import 'package:skin_dd/features/scanner/presentation/cubits/scanner_cubit.dart';

import '../../../../core/theming/text_style_app.dart';

class ListOfSkinDiseaseBlocBuilder extends StatelessWidget {
  const ListOfSkinDiseaseBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScannerCubit, ScannerState>(
      builder: (context, state) {
        if (state is SkindiseasecategoryFailure) {
          return Center(child: Text(state.message));
        }
        if (state is HomeCubiteSuccess) {
          if (context.read<ScannerCubit>().listDiseaseCategory.isEmpty) {
            return Expanded(child: Center(child: Text("No Recent Scans")));
          }
          return ListViewOfCategories(
            getSkinDesieaseList:
                context.read<ScannerCubit>().listDiseaseCategory,
          );
        }

        return ShammerListOFDisease();
      },
    );
  }
}

class ShammerListOFDisease extends StatelessWidget {
  const ShammerListOFDisease({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: height * 0.13,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return ShammerSkinDiseaseItem();
        },
      ),
    );
  }
}

class ShammerSkinDiseaseItem extends StatelessWidget {
  const ShammerSkinDiseaseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,

            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(height: 60, width: 70, color: Colors.grey),
            ),
          ),

          SizedBox(height: 4),
          Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Text("Disease Name", style: TextStylesApp.font13Grey600),
          ),
        ],
      ),
    );
  }
}
