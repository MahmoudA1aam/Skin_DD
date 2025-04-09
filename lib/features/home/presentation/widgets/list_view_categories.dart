import 'package:flutter/material.dart';

import '../../../../core/theming/text_style_app.dart';
import '../../domain/entity/skin_desiease_entitty.dart';

class ListViewOfCategories extends StatelessWidget {
  const ListViewOfCategories({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: height * 0.13,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: getSkinDesieaseList.length,
        itemBuilder: (context, index) {
          return CategoryItem(skinDesieaseEntitty: getSkinDesieaseList[index]);
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.skinDesieaseEntitty});
  final SkinDesieaseEntitty skinDesieaseEntitty;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 70,

            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(skinDesieaseEntitty.image),
              ),

              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 4),
          Text(skinDesieaseEntitty.title, style: TextStylesApp.font12white400),
        ],
      ),
    );
  }
}
