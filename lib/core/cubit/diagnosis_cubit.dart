import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skin_dd/core/constans/shared_pref_constans.dart';
import 'package:skin_dd/core/data/models/diagnosis_model.dart';
import 'package:skin_dd/core/data/repos/diagnosis_repo.dart';

import '../data/models/delete_diagnosis_model.dart';
import '../data/models/diagnosis_response_model.dart';
import '../data/models/get_diagnosis_model.dart';
import '../helper/shared_pref_helper/shared_pref.dart';

part 'diagnosis_state.dart';

class DiagnosisCubit extends Cubit<DiagnosisState> {
  DiagnosisCubit({required this.diagnosisRepo}) : super(DiagnosisInitial());
  final DiagnosisRepo diagnosisRepo;
  GetItemDiagnosisModel? getItemDiagnosisModel;
  Future<void> sendandgetOneItemDiagnosis({
    required DiagnosisModel diagnosisModel,
  }) async {
    emit(DiagnosisLoading());
    var response = await diagnosisRepo.sendDiagnosis(
      diagnosisModel: diagnosisModel,
    );
    response.fold(
      (failure) => emit(DiagnosisFailure(errorMessage: failure.message)),
      (response) {
        emit(SendDiagnosisSuccess(diagnosisModel: response));

        var userId = SharedPreferencesHelper.getDate(
          key: SharedPrefConstans.userId,
        );

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
    final resulte = await diagnosisRepo.getDiagnosis(userId: userId);
    emit(DiagnosisLoading());
    resulte.fold(
      (failure) => emit(DiagnosisFailure(errorMessage: failure.message)),
      (response) {
        emit(DiagnosisLoading());
        GetItemDiagnosisModel item = response.datas!.firstWhere(
          (element) => element.diagnosisId == diagnosisId,
        );

        if (item != null) {
          getItemDiagnosisModel = item;

          emit(GetDiagnosisSuccess(getItemDiagnosisModel: item));
        }
      },
    );
  }

  Future<void> geAlltDiagnosis({required String userId}) async {
    final resulte = await diagnosisRepo.getDiagnosis(userId: userId);
    resulte.fold(
      (failure) => emit(DiagnosisFailure(errorMessage: failure.message)),
      (response) {
        emit(
          GetListDiagnosisSuccess(getAllDiagnosisModel: response.datas ?? []),
        );
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
}
