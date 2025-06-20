import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/models/get_diagnosis_model.dart';

import '../../../../core/helper/functions_helper.dart';
import '../../../scanner/presentation/cubits/scanner_cubit.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.resposne});
  final GetItemDiagnosisModel resposne;

  @override
  Widget build(BuildContext context) {
    final RegExp base64Prefix = RegExp(r'data:image/[a-zA-Z]+;base64,');
    String base64Data = resposne.diseaseHeatmap!.replaceFirst(base64Prefix, "");
    String base64Data22 = resposne.diseaseImage!.replaceFirst(base64Prefix, "");

    Uint8List imagewithheatmap = base64Decode(base64Data);
    Uint8List imagewithoutheatmap = base64Decode(base64Data22);
    double percentageValue = resposne.confidence! * 100;
    String displayPercentageOneDecimal =
        percentageValue.toStringAsFixed(1) + '%';
    return BlocListener<ScannerCubit, ScannerState>(
      listener: (context, state) {
        if (state is DetailsSuccess) {
          Navigator.pop(context);
        }

        if (state is DetailsFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ImageBeforeAndAfter(
              imageWithHeatmap: imagewithheatmap,
              imageWithoutHeatmap: imagewithoutheatmap,
            ),
            const SizedBox(height: 16),

            Card(
              color: Colors.white,
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Disease Name: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          resposne.diseaseName.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Confidence: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          displayPercentageOneDecimal,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Date: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          filterDate(resposne.diagnoseTime.toString()),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            if (resposne.diseaseName != null) ...[
              const SizedBox(height: 16),
              Card(
                elevation: 4,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Description:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (resposne.diseaseExplanation != null)
                        Text(
                          resposne.diseaseExplanation ?? "",
                          style: const TextStyle(fontSize: 16),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class ImageBeforeAndAfter extends StatelessWidget {
  const ImageBeforeAndAfter({
    super.key,
    required this.imageWithHeatmap,
    required this.imageWithoutHeatmap,
  });
  final Uint8List imageWithHeatmap, imageWithoutHeatmap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1 / 1.5,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.memory(imageWithoutHeatmap, fit: BoxFit.fill),
            ),
          ),
        ),
        const SizedBox(width: 2),

        Expanded(
          child: AspectRatio(
            aspectRatio: 1 / 1.5,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Image.memory(imageWithHeatmap, fit: BoxFit.fill),
            ),
          ),
        ),
      ],
    );
  }
}
