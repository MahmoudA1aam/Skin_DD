import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:skin_dd/features/home/presentation/widgets/list_view_categories.dart';
import 'package:skin_dd/features/home/presentation/widgets/list_view_recent_scans.dart';
import 'package:skin_dd/features/home/presentation/widgets/row_title_and_button.dart';
import 'package:skin_dd/features/scanner/presentation/ui/scanner_view.dart';

import '../../../../core/helper/routes/routes_name.dart';
import '../../../../core/theming/colors_app.dart';
import '../../../../core/theming/text_style_app.dart';
import 'home_app_bar_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    required this.onTap,
    required this.controllerValue,
  });
  final VoidCallback onTap;
  final double controllerValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(controllerValue == 0 ? 0 : 16),
          topLeft: Radius.circular(controllerValue == 0 ? 0 : 16),
        ),
      ),

      child: Scaffold(
        appBar: HomeAppBarWidget(
          onpreseed: onTap,
          controllerValue: controllerValue,
        ),
        backgroundColor: Colors.transparent,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final List<CameraDescription> cameras;
            cameras = await availableCameras();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScannerView(cameras: cameras),
              ),
            );
          },
          backgroundColor: ColorsApp.primaryColor,
          child: SvgPicture.asset(
            "assets/icons/outline/scan.svg",
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
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
        ),
      ),
    );
  }
}
