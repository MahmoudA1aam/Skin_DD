import 'package:flutter/material.dart';
import 'package:skin_dd/features/home/presentation/widgets/home_app_bar_widget.dart';
import 'package:skin_dd/features/home/presentation/widgets/list_view_categories.dart';
import 'package:skin_dd/features/home/presentation/widgets/row_title_and_button.dart';

import '../../../../core/theming/text_style_app.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          HomeAppbarWiget(),
          SizedBox(height: 10),
          RowTittleAndButtomText(title: "Skin Diseases"),
          SizedBox(height: 10),
          ListViewOfCategories(),
          SizedBox(height: 10),
          RowTittleAndButtomText(title: "Recent Scans"),
          SizedBox(height: 10),
          ListviewRecomendationDoctor(),
        ],
      ),
    );
  }
}

class ListviewRecomendationDoctor extends StatelessWidget {
  ListviewRecomendationDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: RecomendationDoctorItem(),
          );
        },
      ),
    );
  }
}

class RecomendationDoctorItem extends StatelessWidget {
  const RecomendationDoctorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.asset(
            "assets/images/logo_splash.png",
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
            Text("Eczema", style: TextStylesApp.font16Black600),
            Text("${TimeOfDay.now()}", style: TextStylesApp.font13Grey600),
          ],
        ),
      ],
    );
  }
}
