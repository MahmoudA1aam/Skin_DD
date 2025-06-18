import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart' show SvgPicture;

import 'package:skin_dd/features/home/presentation/widgets/home_view_body.dart';

import '../../../../core/constans/shared_pref_constans.dart';

import '../../../../core/helper/shared_pref_helper/shared_pref.dart';

import '../../../../core/theming/colors_app.dart';
import '../../../scanner/presentation/ui/scanner_view.dart';
import '../widgets/home_app_bar_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
    required this.onTap,
    required this.controllerValue,
  });
  final VoidCallback onTap;
  final double controllerValue;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String userId = '';
  @override
  void initState() {
    userId =
        SharedPreferencesHelper.getDate(
          key: SharedPrefConstans.userId,
        ).toString();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(widget.controllerValue == 0 ? 0 : 16),
          topLeft: Radius.circular(widget.controllerValue == 0 ? 0 : 16),
        ),
      ),
      child: Scaffold(
        appBar: HomeAppBarWidget(
          onpreseed: widget.onTap,
          controllerValue: widget.controllerValue,
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
        body: HomeViewBody(
          onTap: widget.onTap,
          controllerValue: widget.controllerValue,
        ),
      ),
    );
  }
}
