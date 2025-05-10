import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:skeletonizer/skeletonizer.dart';
import 'package:skin_dd/core/helper/shared_pref_helper/shared_pref.dart';
import 'package:skin_dd/core/services/get_it/get_it.dart';
import 'package:skin_dd/features/home/presentation/cubits/home_cubit.dart';

import 'package:skin_dd/features/home/presentation/widgets/list_view_categories.dart';
import 'package:skin_dd/features/home/presentation/widgets/list_view_recent_scans.dart';
import 'package:skin_dd/features/home/presentation/widgets/row_title_and_button.dart';

import '../../../../core/constans/shared_pref_constans.dart';
import '../../../../core/data/models/get_diagnosis_model.dart';
import '../../../../core/data/repos/diagnosis_repo.dart';

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
    // TODO: implement initState

    userId =
        SharedPreferencesHelper.getDate(
          key: SharedPrefConstans.userId,
        ).toString();

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
            BlocBuilder<HomeCubite, HomeCubiteState>(
              bloc: context.read<HomeCubite>()..getDiagnosis(userId: userId),
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
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewRecentScansDemo extends StatelessWidget {
  const ListViewRecentScansDemo({super.key, required this.getSkinDesieaseList});
  final List<GetItemDiagnosisModel> getSkinDesieaseList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: getSkinDesieaseList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: RecentScansItem(respone: getSkinDesieaseList[index]),
          );
        },
      ),
    );
  }
}
