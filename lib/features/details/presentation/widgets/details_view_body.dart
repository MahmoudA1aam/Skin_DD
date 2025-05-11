import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/models/get_diagnosis_model.dart';

import '../../../scanner/presentation/cubits/scanner_cubit.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.reposne});
  final GetItemDiagnosisModel reposne;

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (reposne.diseaseHeatmap != null) ...[
              const Text(
                'Heatmap:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.memory(
                    base64Decode(reposne.diseaseHeatmap!.split(',')[1] ?? ''),
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],

            if (reposne.diseaseExplanation != null)
              Card(
                elevation: 4,
                color: Colors.red[50],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    reposne.diseaseExplanation!,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

            if (reposne.diseaseName != null) ...[
              const SizedBox(height: 16),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Results:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Disease: ${reposne.diseaseName}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (reposne.confidence != null)
                        Text(
                          'Accuracy: ${(reposne.confidence)!.toStringAsFixed(2)}%',
                          style: const TextStyle(fontSize: 16),
                        ),
                      const SizedBox(height: 16),
                      const Text(
                        'Description:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (reposne.diseaseExplanation != null)
                        Text(
                          reposne.diseaseExplanation ?? "",
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
