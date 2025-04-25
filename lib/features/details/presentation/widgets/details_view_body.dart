import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../scanner/data/models/xception_response_model.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.reposne});
  final XceptionResponseModel reposne;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (reposne.gradcam?.heatmap != null) ...[
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
                  base64Decode(reposne.gradcam?.heatmap!.split(',')[1] ?? ''),
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],

          if (reposne.message != null)
            Card(
              elevation: 4,
              color: Colors.red[50],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  reposne.message!,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

          if (reposne.explanation?.diseaseName != null) ...[
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
                      'Disease: ${reposne.explanation?.diseaseName}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (reposne.explanation?.confidence != null)
                      Text(
                        'Accuracy: ${(reposne.explanation?.confidence)!.toStringAsFixed(2)}%',
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
                    if (reposne.explanation?.explanation != null)
                      Text(
                        reposne.explanation?.explanation ?? "",
                        style: const TextStyle(fontSize: 16),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
