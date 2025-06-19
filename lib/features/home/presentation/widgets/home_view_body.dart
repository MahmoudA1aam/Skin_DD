import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skin_dd/core/helper/routes/routes_name.dart';
import 'package:skin_dd/features/home/presentation/widgets/list_of_skin_disease_bloc_builder.dart';

import 'package:skin_dd/features/home/presentation/widgets/list_view_categories.dart';
import 'package:skin_dd/features/home/presentation/widgets/list_view_recent_scans.dart';
import 'package:skin_dd/features/home/presentation/widgets/row_title_and_button.dart';

import '../../../../core/services/get_it/get_it.dart';
import '../../../../core/theming/colors_app.dart';
import '../../../../core/theming/text_style_app.dart';
import '../../../scanner/presentation/cubits/scanner_cubit.dart';
import '../../../skin_diseases/data/repos/skin_diseases_category_repo.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
    required this.onTap,
    required this.controllerValue,
  });
  final VoidCallback onTap;
  final double controllerValue;

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  String userId = '';
  @override
  void initState() {
    /* userId =
        SharedPreferencesHelper.getDate(
          key: SharedPrefConstans.userId,
        ).toString();
    context.read<HomeCubite>().getDiagnosis(userId: userId);*/

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 10),
            RowTittleAndButtomText(title: "Skin Diseases", isSeeMore: false),
            SizedBox(height: 10),
            ListOfSkinDiseaseBlocBuilder(),
            SizedBox(height: 10),
            RowTittleAndButtomText(
              title: "Recent Scans",
              isSeeMore: true,
              onTap: () => Navigator.pushNamed(context, RoutesName.historyView),
            ),
            SizedBox(height: 10),
            BlocBuilder<ScannerCubit, ScannerState>(
              builder: (context, state) {
                if (state is HomeCubiteFailure) {
                  return Center(child: Text(state.message));
                }
                if (state is HomeCubiteSuccess) {
                  if (state.getListDiagnosis.isEmpty) {
                    return Expanded(
                      child: Center(child: Text("No Recent Scans")),
                    );
                  }
                  return ListViewRecentScans(
                    getSkinDesieaseList:
                        context.read<ScannerCubit>().listOfFIveDiagnosisModel,
                  );
                }
                if (state is HomeCubiteLoading) {
                  return Expanded(child: ShammerListViewRecentScansDemo());
                }

                return Expanded(child: ShammerListViewRecentScansDemo());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ShammerListViewRecentScansDemo extends StatelessWidget {
  const ShammerListViewRecentScansDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      itemCount: 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: ShammerRecentScansItem(),
        );
      },
    );
  }
}

class ShammerRecentScansItem extends StatelessWidget {
  const ShammerRecentScansItem({super.key});

  @override
  Widget build(BuildContext context) {
    // فك تشفير السلسلة إلى Uint8List

    return Row(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.white,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: Text("Disease Name", style: TextStylesApp.font16Black600),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: Text(
                "Disease Explanation",
                style: TextStylesApp.font13Grey600,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: Text("Disease Date", style: TextStylesApp.font13Grey600),
            ),
          ],
        ),
      ],
    );
  }
}
