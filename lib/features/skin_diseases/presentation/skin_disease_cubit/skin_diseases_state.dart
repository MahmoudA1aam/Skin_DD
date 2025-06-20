part of 'skin_diseases_cubit.dart';

@immutable
abstract class SkinDiseasesState {}

class SkinDiseasesInitial extends SkinDiseasesState {}

class SkindiseasecategorySuccess extends SkinDiseasesState {
  final List<Data> getListDiseaseCategory;
  SkindiseasecategorySuccess({required this.getListDiseaseCategory});
}

class SkindiseasecategoryFailure extends SkinDiseasesState {
  final String message;
  SkindiseasecategoryFailure({required this.message});
}

class SkindiseasecategoryLoading extends SkinDiseasesState {}
