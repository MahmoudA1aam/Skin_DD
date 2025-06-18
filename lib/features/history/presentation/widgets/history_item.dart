import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../../core/data/models/get_diagnosis_model.dart';
import '../../../../core/helper/functions_helper.dart';
import '../../../../core/theming/text_style_app.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key, required this.respone});
  final GetItemDiagnosisModel respone;

  @override
  Widget build(BuildContext context) {
    final Uint8List image = base64Decode(respone.diseaseImage ?? "");
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
