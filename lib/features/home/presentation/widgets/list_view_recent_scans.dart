import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skin_dd/core/helper/functions_helper.dart';
import 'package:skin_dd/core/helper/routes/routes_name.dart';

import '../../../../core/data/models/get_diagnosis_model.dart';
import '../../../../core/theming/text_style_app.dart';

class ListViewRecentScans extends StatelessWidget {
  const ListViewRecentScans({super.key, required this.getSkinDesieaseList});
  final List<GetItemDiagnosisModel> getSkinDesieaseList;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: getSkinDesieaseList.isEmpty?
          Center(child: Text('No scans yet'),)
          :ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: min(3, getSkinDesieaseList.length),
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

class RecentScansItem extends StatelessWidget {
  const RecentScansItem({super.key, required this.respone});
  final GetItemDiagnosisModel respone;

  @override
  Widget build(BuildContext context) {
    // final Uint8List image = base64Decode(respone.diseaseImage ?? "");
    // String base64Data = respone.diseaseHeatmap!.replaceFirst(
    //   "data:image/png;base64,",
    //   "",
    // );

    // فك تشفير السلسلة إلى Uint8List
    //Uint8List bytes = base64Decode(base64Data);
    Uint8List? bytes;
    if (respone.diseaseHeatmap != null && respone.diseaseHeatmap!.isNotEmpty) {
      try {
        String base64Data = respone.diseaseHeatmap!.split(',').last;
        bytes = base64Decode(base64Data);
      } catch (e) {
        bytes = null;
      }
    }

    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child:
           bytes==null?
           Container(
             color: Colors.grey,
             height: 110,
             width: 110,)
          :Image.memory(
            bytes,
            height: 110,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              respone.diseaseName ?? "",
              style: TextStylesApp.font16Black600,
            ),
            Text(
              "${filterDate(respone.diagnoseTime ?? "")}",
              style: TextStylesApp.font13Grey600,
            ),
          ],
        ),
      ],
    );
  }
}
