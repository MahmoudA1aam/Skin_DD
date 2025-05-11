import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'package:skin_dd/features/home/presentation/widgets/list_view_categories.dart';
import 'package:skin_dd/features/home/presentation/widgets/list_view_recent_scans.dart';
import 'package:skin_dd/features/home/presentation/widgets/row_title_and_button.dart';

import '../../../../core/theming/text_style_app.dart';
import '../../../scanner/presentation/cubits/scanner_cubit.dart';

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
            RowTittleAndButtomText(title: "Skin Diseases"),
            SizedBox(height: 10),
            ListViewOfCategories(),
            SizedBox(height: 10),
            RowTittleAndButtomText(title: "Recent Scans"),
            SizedBox(height: 10),
            BlocConsumer<ScannerCubit, ScannerState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is HomeCubiteFailure) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text(state.message)),
                  );
                }
                if (state is HomeCubiteSuccess) {
                  return ListViewRecentScans(
                    getSkinDesieaseList: state.getListDiagnosis,
                  );
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
      itemCount: 10,
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
              child: Text("Disease Name", style: TextStylesApp.font13Grey600),
            ),
          ],
        ),
      ],
    );
  }
}
