import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../../core/data/models/get_diagnosis_model.dart';
import '../../../../core/helper/functions_helper.dart';
import '../../../../core/theming/text_style_app.dart';

class RecentScansItem extends StatelessWidget {
  const RecentScansItem({super.key, required this.respone});
  final GetItemDiagnosisModel respone;

  @override
  Widget build(BuildContext context) {
    // final Uint8List image = base64Decode(respone.diseaseImage ?? "");
    String base64Data = respone.diseaseHeatmap!.replaceFirst(
      "data:image/png;base64,",
      "",
    );

    // فك تشفير السلسلة إلى Uint8List
    Uint8List bytes = base64Decode(base64Data);
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.memory(
            bytes,
            height: 110,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                respone.diseaseName ?? "",
                style: TextStylesApp.font16Black600,
              ),
              SizedBox(height: 5),
              Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                "${respone.diseaseExplanation}",
                style: TextStylesApp.font13Grey600,
              ),
              SizedBox(height: 5),
              Text(
                "${filterDate(respone.diagnoseTime ?? "")}",
                style: TextStylesApp.font13Grey600.copyWith(
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
