import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:skin_dd/features/scanner/data/models/xception_response_model.dart';
import 'package:skin_dd/features/scanner/data/repos/scanner_repo.dart';

part 'scanner_state.dart';

class ScannerCubit extends Cubit<ScannerState> {
  final ScannerRepo scannerRepo;
  ScannerCubit({required this.scannerRepo}) : super(ScannerInitial());
  bool flashOn = false;
  bool imageSuccess = false;

  takePicture({required CameraController cameraController}) async {
    if (!cameraController.value.isInitialized ||
        cameraController.value.isTakingPicture) {
      return;
    }

    final XFile file = await cameraController.takePicture();
    emit(ScannerLoading());
    var responseanalyze = await analyzeImage(file);
    if (responseanalyze) {
      emit(ScannerLoading());
      imageSuccess = true;
      if (flashOn) {
        cameraController.setFlashMode(FlashMode.off);
        flashOn = false;
      }

      var response = await scannerRepo.uploadImage(image: file);

      emit(ScannerLoading());
      response.fold(
        (failure) => emit(ScannerFailure(errorMessage: failure.message)),
        (response) => emit(ScannerSuccess(xceptionResponseModel: response)),
      );

      Timer(Duration(seconds: 2), () {
        emit(ImageSuccessState());
        imageSuccess = false;
      });
    } else {
      emit(ScannerFailure(errorMessage: "try again"));
    }
  }

  Future<void> chooseImage({required ImagePicker picker}) async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(ScannerLoading());
      var response = await scannerRepo.uploadImage(image: image);

      response.fold(
        (failure) => emit(ScannerFailure(errorMessage: failure.message)),
        (response) => emit(ScannerSuccess(xceptionResponseModel: response)),
      );
    }
  }

  Future<bool> analyzeImage(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final imageLabeler = ImageLabeler(options: ImageLabelerOptions());

    final labels = await imageLabeler.processImage(inputImage);
    //final buffer = StringBuffer();
    bool isSuccess = false;

    for (int i = 0; i < labels.length; i++) {
      final confidence = labels[i].confidence * 100;
      final labelText = labels[i].label;

      // buffer.writeln('$labelText : ${confidence.toStringAsFixed(2)}%');

      if ((labelText == "Skin" && confidence >= 80) ||
          (labelText == "Hand" && confidence >= 95)) {
        isSuccess = true;
      }
    }

    await imageLabeler.close();
    return isSuccess;
  }

  Future<void> toggleFlash({required CameraController cameraController}) async {
    flashOn = !flashOn;
    emit(FlashModestate());
    await cameraController.setFlashMode(
      flashOn ? FlashMode.torch : FlashMode.off,
    );
  }
}
