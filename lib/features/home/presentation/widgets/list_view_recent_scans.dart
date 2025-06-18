import 'package:flutter/material.dart';

import 'package:skin_dd/core/helper/routes/routes_name.dart';
import 'package:skin_dd/features/home/presentation/widgets/recent_scans_item.dart';

import '../../../../core/data/models/get_diagnosis_model.dart';

class ListViewRecentScans extends StatelessWidget {
  const ListViewRecentScans({super.key, required this.getSkinDesieaseList});
  final List<GetItemDiagnosisModel> getSkinDesieaseList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,

        padding: EdgeInsets.zero,
        itemCount: getSkinDesieaseList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutesName.detailsView,
                  arguments: getSkinDesieaseList[index],
                );
              },
              child: RecentScansItem(respone: getSkinDesieaseList[index]),
            ),
          );
        },
      ),
    );
  }
}
