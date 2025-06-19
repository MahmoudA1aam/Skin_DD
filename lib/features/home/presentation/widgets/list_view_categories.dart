import 'package:flutter/material.dart';

import '../../../../core/helper/routes/routes_name.dart';
import '../../../../core/theming/text_style_app.dart';
import '../../../skin_diseases/data/models/skin_disease_category_model.dart';

class ListViewOfCategories extends StatelessWidget {
  const ListViewOfCategories({super.key, required this.getSkinDesieaseList});
  final List<Data> getSkinDesieaseList;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: height * 0.13,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: getSkinDesieaseList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap:
                () => Navigator.pushNamed(
                  context,
                  RoutesName.skinDiseasesdetails,
                  arguments: getSkinDesieaseList[index],
                ),
            child: CategoryItem(skinDesieaseItem: getSkinDesieaseList[index]),
          );
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.skinDesieaseItem});
  final Data skinDesieaseItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),

            child:
                skinDesieaseItem.diseaseImage == null ||
                        skinDesieaseItem.diseaseImage == ""
                    ? Image.asset(
                      "assets/images/Image.png",
                      height: 60,
                      width: 70,
                      fit: BoxFit.cover,
                    )
                    : Image.network(
                      skinDesieaseItem.diseaseImage ?? "",
                      height: 60,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
          ),
          const SizedBox(height: 4),
          Text(
            skinDesieaseItem.diseaseName ?? "Cancer",
            style: TextStylesApp.font12white400,
          ),
        ],
      ),
    );
  }
}
