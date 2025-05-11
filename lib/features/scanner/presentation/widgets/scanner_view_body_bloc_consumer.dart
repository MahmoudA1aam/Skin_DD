import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../cubits/scanner_cubit.dart';

class ScannerViewBodyBlocConsumer extends StatefulWidget {
  const ScannerViewBodyBlocConsumer({super.key, required this.cameras});
  final List<CameraDescription> cameras;
  @override
  State<ScannerViewBodyBlocConsumer> createState() =>
      _ScannerViewBodyBlocConsumerState();
}

class _ScannerViewBodyBlocConsumerState
    extends State<ScannerViewBodyBlocConsumer> {
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

    return Column(
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
    );
  }
}
