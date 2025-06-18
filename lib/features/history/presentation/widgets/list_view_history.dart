import 'package:flutter/material.dart';

import '../../../../core/data/models/get_diagnosis_model.dart';
import '../../../../core/helper/routes/routes_name.dart';

import '../../../home/presentation/widgets/list_view_recent_scans.dart';
import '../../../home/presentation/widgets/recent_scans_item.dart';

class ListViewHistory extends StatelessWidget {
  const ListViewHistory({super.key, required this.getSkinDesieaseList});
  final List<GetItemDiagnosisModel> getSkinDesieaseList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
