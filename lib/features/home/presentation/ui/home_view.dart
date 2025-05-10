import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:skin_dd/features/home/presentation/cubits/home_cubit.dart';
import 'package:skin_dd/features/home/presentation/widgets/home_view_body.dart';

import '../../../../core/data/repos/diagnosis_repo.dart';
import '../../../../core/services/get_it/get_it.dart';
import '../../../../core/theming/colors_app.dart';
import '../../../scanner/presentation/ui/scanner_view.dart';
import '../widgets/home_app_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({
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
        body: BlocProvider(
          create:
              (context) =>
                  HomeCubite(diagnosisRepo: getIt.get<DiagnosisRepo>()),
          child: HomeViewBody(onTap: onTap, controllerValue: controllerValue),
        ),
      ),
    );
  }
}
