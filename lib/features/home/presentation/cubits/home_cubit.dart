/*import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skin_dd/core/data/models/get_diagnosis_model.dart';
import 'package:skin_dd/core/data/repos/diagnosis_repo.dart';
import 'package:skin_dd/core/helper/shared_pref_helper/shared_pref.dart';

import '../../../../core/constans/shared_pref_constans.dart';
import '../../../../core/data/models/delete_diagnosis_model.dart';

part 'home_cubite_state.dart';

class HomeCubite extends Cubit<HomeCubiteState> {
  HomeCubite({required this.diagnosisRepo}) : super(HomeCubiteInitial());

  final DiagnosisRepo diagnosisRepo;
  Future<void> getDiagnosis({required String userId}) async {
    final resulte = await diagnosisRepo.getDiagnosis(userId: userId);
    resulte.fold(
      (failure) => emit(HomeCubiteFailure(message: failure.message)),
      (response) {
        log("response: ${response.datas.toString()}");
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
      getDiagnosis(userId: id.toString());
    });
  }
}
*/
