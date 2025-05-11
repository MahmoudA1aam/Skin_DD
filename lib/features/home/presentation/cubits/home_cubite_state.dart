/*part of 'home_cubit.dart';

@immutable
abstract class HomeCubiteState {}

class HomeCubiteInitial extends HomeCubiteState {}

class HomeCubiteSuccess extends HomeCubiteState {
  HomeCubiteSuccess({required this.getListDiagnosis});
  final List<GetItemDiagnosisModel> getListDiagnosis;
}

class HomeCubiteFailure extends HomeCubiteState {
  final String message;
  HomeCubiteFailure({required this.message});
}

class HomeCubiteLoading extends HomeCubiteState {}

class DetailsSuccess extends HomeCubiteState {
  final DeleteDiagnosisResponseModel deleteDiagnosisResponseModel;
  DetailsSuccess(this.deleteDiagnosisResponseModel);
}

class DetailsFailure extends HomeCubiteState {
  final String message;
  DetailsFailure(this.message);
}

class DetailsLoading extends HomeCubiteState {}
*/
