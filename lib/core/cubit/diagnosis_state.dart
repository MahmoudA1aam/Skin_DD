part of 'diagnosis_cubit.dart';

@immutable
abstract class DiagnosisState {}

class DiagnosisInitial extends DiagnosisState {}

class DiagnosisSuccess extends DiagnosisState {}

class DiagnosisFailure extends DiagnosisState {
  final String errorMessage;
  DiagnosisFailure({required this.errorMessage});
}

class DiagnosisLoading extends DiagnosisState {}

class GetListDiagnosisSuccess extends DiagnosisState {
  final List<GetItemDiagnosisModel> getAllDiagnosisModel;
  GetListDiagnosisSuccess({required this.getAllDiagnosisModel});
}

class GetDiagnosisSuccess extends DiagnosisState {
  final GetItemDiagnosisModel getItemDiagnosisModel;
  GetDiagnosisSuccess({required this.getItemDiagnosisModel});
}

class SendDiagnosisSuccess extends DiagnosisState {
  final DiagnosisResponseModel diagnosisModel;
  SendDiagnosisSuccess({required this.diagnosisModel});
}

class DetailsSuccess extends DiagnosisState {
  final DeleteDiagnosisResponseModel deleteDiagnosisResponseModel;
  DetailsSuccess(this.deleteDiagnosisResponseModel);
}

class DetailsFailure extends DiagnosisState {
  final String message;
  DetailsFailure(this.message);
}

class DetailsLoading extends DiagnosisState {}
