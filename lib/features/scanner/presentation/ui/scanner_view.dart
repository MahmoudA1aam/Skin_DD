import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:skin_dd/features/scanner/presentation/widgets/scanner_view_body.dart';

class ScannerView extends StatelessWidget {
  const ScannerView({super.key, required this.cameras});
  final List<CameraDescription> cameras;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ScannerViewBody(cameras: cameras));
  }
}
