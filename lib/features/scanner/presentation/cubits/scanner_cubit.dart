import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:skin_dd/core/constans/shared_pref_constans.dart';
import 'package:skin_dd/core/data/models/diagnosis_response_model.dart';
import 'package:skin_dd/core/data/repos/diagnosis_repo.dart';
import 'package:skin_dd/core/helper/shared_pref_helper/shared_pref.dart';

import 'package:skin_dd/features/scanner/data/repos/scanner_repo.dart';
import 'package:skin_dd/features/skin_diseases/data/repos/skin_diseases_category_repo.dart';

import '../../../../core/data/models/delete_diagnosis_model.dart';
import '../../../../core/data/models/diagnosis_model.dart';
import '../../../../core/data/models/get_diagnosis_model.dart';
import '../../../skin_diseases/data/models/skin_disease_category_model.dart';

part 'scanner_state.dart';

class ScannerCubit extends Cubit<ScannerState> {
  final ScannerRepo scannerRepo;
  final DiagnosisRepo diagnosisRepo;
  final SkinDiseasesCategoryRepo skinDiseasesCategoryRepo;
  List<GetItemDiagnosisModel> listOfFIveDiagnosisModel = [];
  List<Data> listDiseaseCategory = [];
  GetItemDiagnosisModel? getItemDiagnosisModel = GetItemDiagnosisModel();
  ScannerCubit({
    required this.scannerRepo,
    required this.diagnosisRepo,
    required this.skinDiseasesCategoryRepo,
  }) : super(ScannerInitial());
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
      imageSuccess = true;
      if (flashOn) {
        cameraController.setFlashMode(FlashMode.off);
        flashOn = false;
      }

      var response = await scannerRepo.uploadImage(image: file);

      response.fold(
        (failure) => emit(ScannerFailure(errorMessage: failure.message)),
        (response) async {
          var image = File(file.path);
          final bytes = await image.readAsBytes();
          final imageEncode = base64Encode(bytes);
          var userId = SharedPreferencesHelper.getDate(
            key: SharedPrefConstans.userId,
          );
          DiagnosisModel diagnosisModel = DiagnosisModel(
            confidence: response.explanation!.confidence ?? 0,
            diseaseName: response.explanation!.diseaseName ?? "",
            diseaseExplanation:
                response.explanation!.explanation ?? "Cancer not found",
            diseaseHeatmap: response.gradcam!.heatmap ?? "",
            userId: userId.toString(),
            diseaseImage: imageEncode,
          );
          Timer(Duration(seconds: 2), () {
            emit(ImageSuccessState());
            imageSuccess = false;
          });
          sendandgetOneItemDiagnosis(diagnosisModel: diagnosisModel);
        },
      );
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
        (response) async {
          var imageDisease = File(image.path);
          final bytes = await imageDisease.readAsBytes();
          final imageEncode = base64Encode(bytes);
          var userId = SharedPreferencesHelper.getDate(
            key: SharedPrefConstans.userId,
          );
          DiagnosisModel diagnosisModel = DiagnosisModel(
            confidence: response.explanation!.confidence ?? 0.0,
            diseaseName: response.explanation!.diseaseName ?? "",
            diseaseExplanation:
                response.explanation!.explanation ?? "Cancer not found",
            diseaseHeatmap: response.gradcam!.heatmap ?? "",
            userId: userId.toString(),
            diseaseImage: imageEncode,
          );
          sendandgetOneItemDiagnosis(diagnosisModel: diagnosisModel);
        },
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

  Future<void> sendandgetOneItemDiagnosis({
    required DiagnosisModel diagnosisModel,
  }) async {
    emit(ScannerLoading());
    var response = await diagnosisRepo.sendDiagnosis(
      diagnosisModel: diagnosisModel,
    );
    response.fold(
      (failure) => emit(ScannerFailure(errorMessage: failure.message)),
      (response) {
        emit(SendDiagnosisSuccess(diagnosisModel: response));
        var userId = SharedPreferencesHelper.getDate(
          key: SharedPrefConstans.userId,
        );
        emit(ScannerLoading());
        getOneItemDiagnosis(
          userId: userId.toString(),
          diagnosisId: response.diagnosisId,
        );
      },
    );
  }

  Future<void> getOneItemDiagnosis({
    required String userId,
    required String diagnosisId,
  }) async {
    emit(ScannerLoading());
    final resulte = await diagnosisRepo.getDiagnosis(userId: userId);

    resulte.fold(
      (failure) => emit(ScannerFailure(errorMessage: failure.message)),
      (response) {
        GetItemDiagnosisModel item = response.datas!.firstWhere(
          (element) => element.diagnosisId == diagnosisId,
        );
        getItemDiagnosisModel = item;
        emit(GetDiagnosisSuccess(getItemDiagnosisModel: item));
      },
    );
  }

  Future<void> geAlltDiagnosis({required String userId}) async {
    emit(HomeCubiteLoading());
    final resulte = await diagnosisRepo.getDiagnosis(userId: userId);

    resulte.fold(
      (failure) => emit(HomeCubiteFailure(message: failure.message)),
      (response) async {
        final listOfAllDiagnosisModel = response.datas ?? [];
        listOfAllDiagnosisModel.sort((a, b) {
          if (a.diagnoseTime == null) return 1;
          if (b.diagnoseTime == null) return -1;
          try {
            DateTime dateA = DateTime.parse(a.diagnoseTime!);
            DateTime dateB = DateTime.parse(b.diagnoseTime!);

            return dateB.compareTo(dateA);
          } catch (e) {
            print('Could not parse date: $e');
            return 0;
          }
        });
        listOfFIveDiagnosisModel = listOfAllDiagnosisModel.take(6).toList();
        await getSkinDiseasesCategory();
        emit(HomeCubiteSuccess(getListDiagnosis: response.datas ?? []));
      },
    );
  }

  Future<void> deleteDiagnosis({
    required DeleteDiagnosisModel userId,
    required String diagonoseId,
  }) async {
    final result = await diagnosisRepo.deleteDiagnosis(
      userId: userId,
      diagonoseId: diagonoseId,
    );
    result.fold((failure) => emit(DetailsFailure(failure.message)), (
      response,
    ) async {
      emit(DetailsSuccess(response));
      var id = SharedPreferencesHelper.getDate(key: SharedPrefConstans.userId);
      geAlltDiagnosis(userId: id.toString());
    });
  }

  Future<void> getSkinDiseasesCategory() async {
    emit(SkindiseasecategoryLoading());
    final result = await skinDiseasesCategoryRepo.getSkinDiseases();
    result.fold(
      (failure) => emit(SkindiseasecategoryFailure(message: failure.message)),
      (response) {
        listDiseaseCategory = response.data ?? [];
      },
    );
  }
}
