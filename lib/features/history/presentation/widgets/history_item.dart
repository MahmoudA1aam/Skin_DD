import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../core/data/models/get_diagnosis_model.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key, required this.diagnosisItemModel});
  final GetItemDiagnosisModel diagnosisItemModel;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.sizeOf(context);
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          height: mediaQuery.height * 0.17,
          width: mediaQuery.width * 0.4,
          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Container(
          height: mediaQuery.height * 0.14,
          width: mediaQuery.width * 0.38,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black, // لون الحدود
              width: 2.0, // عرض الحدود
            ),
            borderRadius: BorderRadius.circular(
              8.0,
            ), // اختياري: إضافة زوايا دائرية للحدود
          ),
          child: Image.memory(
            base64Decode(
              diagnosisItemModel.diseaseHeatmap!.split(',')[1] ?? '',
            ),

            fit: BoxFit.cover, // اختياري: لضبط كيفية عرض الصورة داخل الحاوية
          ),
        ),
        Positioned(
          bottom: -25,
          top: 50,
          child: Center(
            child: Text(
              diagnosisItemModel.diseaseName ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
