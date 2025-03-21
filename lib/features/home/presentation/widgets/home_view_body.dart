import 'package:flutter/material.dart';

import 'package:skin_dd/features/home/presentation/widgets/home_app_bar_widget.dart';
import 'package:skin_dd/features/home/presentation/widgets/list_view_categories.dart';
import 'package:skin_dd/features/home/presentation/widgets/list_view_recent_scans.dart';
import 'package:skin_dd/features/home/presentation/widgets/row_title_and_button.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
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
            ListViewRecentScans(),
          ],
        ),
      ),
    );
  }
}
