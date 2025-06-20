import 'package:flutter/material.dart';

import 'package:skin_dd/features/skin_diseases/data/models/skin_disease_category_model.dart';

class SkinDiseasesItem extends StatelessWidget {
  const SkinDiseasesItem({super.key, required this.skinDiseaseEntity});

  final Data skinDiseaseEntity;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double cardWidth = mediaQuery.width * 0.4;
    final double imageHeight = mediaQuery.height * 0.13;

    return SizedBox(
      width: cardWidth,

      child: Card(
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              skinDiseaseEntity.diseaseImage!,
              height: imageHeight,

              fit: BoxFit.cover,

              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: imageHeight,
                  color: Colors.grey[200],
                  child: const Icon(
                    Icons.image_not_supported_outlined,
                    color: Colors.grey,
                  ),
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 10,
              ),
              child: Text(
                skinDiseaseEntity.diseaseName ?? "Cancer",
                textAlign: TextAlign.center,

                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
