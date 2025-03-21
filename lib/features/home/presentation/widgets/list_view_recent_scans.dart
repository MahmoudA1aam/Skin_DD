import 'package:flutter/material.dart';
import 'package:skin_dd/features/home/domain/entity/skin_desiease_entitty.dart';

import '../../../../core/theming/text_style_app.dart';

class ListViewRecentScans extends StatelessWidget {
  const ListViewRecentScans({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: getSkinDesieaseList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: RecomendationDoctorItem(
              skinDesieaseEntitty: getSkinDesieaseList[index],
            ),
          );
        },
      ),
    );
  }
}

class RecomendationDoctorItem extends StatelessWidget {
  const RecomendationDoctorItem({super.key, required this.skinDesieaseEntitty});
  final SkinDesieaseEntitty skinDesieaseEntitty;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.asset(
            skinDesieaseEntitty.image,
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
              skinDesieaseEntitty.title,
              style: TextStylesApp.font16Black600,
            ),
            Text("${TimeOfDay.now()}", style: TextStylesApp.font13Grey600),
          ],
        ),
      ],
    );
  }
}
