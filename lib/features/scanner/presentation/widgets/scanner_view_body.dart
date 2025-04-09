import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';

class ScannerViewBody extends StatefulWidget {
  const ScannerViewBody({super.key, required this.cameras});
  final List<CameraDescription> cameras;
  @override
  State<ScannerViewBody> createState() => _ScannerViewBodyState();
}

class _ScannerViewBodyState extends State<ScannerViewBody> {
  late CameraController cameraController;
  bool setFlash = false;
  bool takeImage = false;
  bool successImage = false;
  String imageLabel = "";
  late CameraImage cameraImage;

  @override
  void initState() {
    cameraController = CameraController(
      widget.cameras[0],
      ResolutionPreset.max,
    );
    cameraController.initialize().then((value) {
      cameraController?.startImageStream((image) => cameraImage = image);
      if (!mounted) {
        return;
      }
      setState(() {});
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    cameraController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void flashMode() {
    if (setFlash == true) {
      cameraController.setFlashMode(FlashMode.torch);
    } else {
      cameraController.setFlashMode(FlashMode.off);
    }
  }

  Future takePicture() async {
    if (cameraController == null || !cameraController.value.isInitialized) {
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      final XFile file = await cameraController.takePicture();

      getImageLabels(file);
      // await File(file.path).delete();
    } on CameraException catch (e) {
      return null;
    }
  }

  void getImageLabels(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    ImageLabeler imageLabeler = ImageLabeler(options: ImageLabelerOptions());
    List<ImageLabel> labels = await imageLabeler.processImage(inputImage);
    StringBuffer sd = StringBuffer();

    for (int i = 0; i <= labels.length; i++) {
      double confidence = labels[i].confidence * 100;
      String lableText = labels[i].label;
      double confidencef = labels[i].confidence;

      sd.write(lableText);
      sd.write(" : ");
      sd.write((confidencef * 100).toStringAsFixed(2));
      sd.write("%\n");
      imageLabel = sd.toString();
      if ((labels[i].label == "Skin" && confidence >= 80) ||
          (labels[i].label == "Hand" && confidence >= 95)) {
        print("lableText============$confidence");
        successImage = true;

        setState(() {});
        // SnackBarService.showSuccessMessage("Success");

        return;
      } else if (labels[i].label == "Skin" && confidence > 80) {
        successImage = false;
        //SnackBarService.showErrorMessage("Take another photo more details");
        setState(() {});
      } else {
        successImage = false;
        //SnackBarService.showErrorMessage("Take another Photo");
        setState(() {});
      }
      print("successImage=$successImage");
    }

    imageLabeler.close();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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
                          color: successImage ? Colors.green : Colors.grey,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
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
                    onPressed: () {
                      flashMode();

                      setFlash ?? !setFlash;
                      setState(() {});
                    },
                    icon:
                        setFlash
                            ? const Icon(Icons.flash_on, color: Colors.grey)
                            : const Icon(Icons.flash_off, color: Colors.grey),
                  ),
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      takePicture();

                      setState(() {});
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
