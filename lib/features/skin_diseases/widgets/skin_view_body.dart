import 'package:flutter/material.dart';
import 'package:skin_dd/features/skin_diseases/widgets/skin_diseases_item.dart';

import '../../../core/theming/text_style_app.dart';
import '../../home/domain/entity/skin_desiease_entitty.dart';

class SkinViewBody extends StatelessWidget {
  const SkinViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 16, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Skin Diseases", style: TextStylesApp.font20Black600),
          SizedBox(height: 10),

          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: getSkinDesieaseList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,

                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return SkinDiseasesItem(
                  skinDesieaseEntitty: getSkinDesieaseList[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
