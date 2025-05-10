import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skin_dd/core/helper/routes/routes_name.dart';

import 'package:skin_dd/features/scanner/presentation/cubits/scanner_cubit.dart';

class ScannerViewBody extends StatefulWidget {
  const ScannerViewBody({super.key, required this.cameras});
  final List<CameraDescription> cameras;

  @override
  State<ScannerViewBody> createState() => _ScannerViewBodyState();
}

class _ScannerViewBodyState extends State<ScannerViewBody> {
  late CameraController cameraController;
  late ImagePicker imagePicker;
  @override
  void initState() {
    imagePicker = ImagePicker();
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    cameraController = CameraController(
      widget.cameras[0],
      ResolutionPreset.max,
    );

    await cameraController.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);

    return SafeArea(
      child: BlocConsumer<ScannerCubit, ScannerState>(
        listener: (context, state) {
          if (state is ScannerSuccess) {
            if (state is SendDiagnosisSuccess) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Success Send Diagnosis")));
            }
            Navigator.pushNamed(
              context,
              RoutesName.detailsView,
              arguments: state.xceptionResponseModel,
            );
          }
          if (state is ScannerFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: mediaQuery.height * 0.75,
                        width: double.infinity,
                        child: CameraPreview(
                          cameraController,
                          child: Center(
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color:
                                      context.read<ScannerCubit>().imageSuccess
                                          ? Colors.green
                                          : Colors.grey,
                                  width: 3,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            onPressed: () async {
                              await context.read<ScannerCubit>().toggleFlash(
                                cameraController: cameraController,
                              );
                            },
                            icon: Icon(
                              context.read<ScannerCubit>().flashOn
                                  ? Icons.flash_on
                                  : Icons.flash_off,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {
                              context.read<ScannerCubit>().takePicture(
                                cameraController: cameraController,
                              );
                            },
                            child: const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 35,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () async {
                              await context.read<ScannerCubit>().chooseImage(
                                picker: imagePicker,
                              );
                            },
                            icon: SvgPicture.asset(
                              "assets/icons/bold/gallery.svg",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (state is ScannerLoading)
                Container(
                  color: Colors.black54, // خلفية شفافة لتغطية الشاشة
                  child: const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(color: Colors.white),
                        SizedBox(height: 10),
                        Text(
                          'Analyzing image...',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
