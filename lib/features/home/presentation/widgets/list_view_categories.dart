import 'package:flutter/material.dart';

import '../../../../core/theming/text_style_app.dart';

class ListViewOfCategories extends StatelessWidget {
  const ListViewOfCategories({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: height * 0.11,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return CategoryItem();
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

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
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 4),
          Text("Category", style: TextStylesApp.font12white400),
        ],
      ),
    );
  }
}
