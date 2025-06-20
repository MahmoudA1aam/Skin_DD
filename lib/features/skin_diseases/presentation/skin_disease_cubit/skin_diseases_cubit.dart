import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/skin_disease_category_model.dart';
import '../../data/repos/skin_diseases_category_repo.dart';

part 'skin_diseases_state.dart';

class SkinDiseasesCubit extends Cubit<SkinDiseasesState> {
  SkinDiseasesCubit({required this.skinDiseasesCategoryRepo})
    : super(SkinDiseasesInitial());
  final SkinDiseasesCategoryRepo skinDiseasesCategoryRepo;
  List<Data> listDiseaseCategory = [];
  void getSkinDiseasesCategory() async {
    emit(SkindiseasecategoryLoading());
    final result = await skinDiseasesCategoryRepo.getSkinDiseases();
    result.fold(
      (failure) => emit(SkindiseasecategoryFailure(message: failure.message)),
      (response) {
        listDiseaseCategory = response.data ?? [];
        emit(
          SkindiseasecategorySuccess(
            getListDiseaseCategory: listDiseaseCategory,
          ),
        );
      },
    );
  }
}
