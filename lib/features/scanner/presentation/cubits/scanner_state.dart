part of 'scanner_cubit.dart';

@immutable
abstract class ScannerState {}

class ScannerInitial extends ScannerState {}

class ScannerFailure extends ScannerState {
  final String errorMessage;
  ScannerFailure({required this.errorMessage});
}

class ScannerSuccess extends ScannerState {
  /* final XceptionResponseModel xceptionResponseModel;
  ScannerSuccess({required this.xceptionResponseModel});*/
}

class SendDiagnosisSuccess extends ScannerState {
  final DiagnosisResponseModel diagnosisModel;
  SendDiagnosisSuccess({required this.diagnosisModel});
}

class GetDiagnosisSuccess extends ScannerState {
  final GetItemDiagnosisModel getItemDiagnosisModel;
  GetDiagnosisSuccess({required this.getItemDiagnosisModel});
}

class GetListDiagnosisSuccess extends ScannerState {
  final List<GetItemDiagnosisModel> getAllDiagnosisModel;
  GetListDiagnosisSuccess({required this.getAllDiagnosisModel});
}

class ScannerLoading extends ScannerState {}

class FlashModestate extends ScannerState {}

class ImageSuccessState extends ScannerState {}

class HomeCubiteSuccess extends ScannerState {
  HomeCubiteSuccess({required this.getListDiagnosis});
  final List<GetItemDiagnosisModel> getListDiagnosis;
}

class HomeCubiteFailure extends ScannerState {
  final String message;
  HomeCubiteFailure({required this.message});
}

class HomeCubiteLoading extends ScannerState {}

class DetailsSuccess extends ScannerState {
  final DeleteDiagnosisResponseModel deleteDiagnosisResponseModel;
  DetailsSuccess(this.deleteDiagnosisResponseModel);
}

class DetailsFailure extends ScannerState {
  final String message;
  DetailsFailure(this.message);
}

class DetailsLoading extends ScannerState {}

class SkindiseasecategoryFailure extends ScannerState {
  final String message;
  SkindiseasecategoryFailure({required this.message});
}

class SkindiseasecategoryLoading extends ScannerState {}
