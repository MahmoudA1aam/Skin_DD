import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skin_dd/core/data/models/get_diagnosis_model.dart';
import 'package:skin_dd/core/data/repos/diagnosis_repo.dart';

part 'home_cubite_state.dart';

class HomeCubite extends Cubit<HomeCubiteState> {
  HomeCubite({required this.diagnosisRepo}) : super(HomeCubiteInitial());

  final DiagnosisRepo diagnosisRepo;
  Future<void> getDiagnosis({required String userId}) async {
    final resulte = await diagnosisRepo.getDiagnosis(userId: userId);
    resulte.fold(
      (failure) => emit(HomeCubiteFailure(message: failure.message)),
      (response) {
        emit(HomeCubiteSuccess(getListDiagnosis: response.datas ?? []));
      },
    );
  }
}
