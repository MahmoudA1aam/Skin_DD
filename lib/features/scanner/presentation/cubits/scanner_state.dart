part of 'scanner_cubit.dart';

@immutable
abstract class ScannerState {}

class ScannerInitial extends ScannerState {}

class ScannerFailure extends ScannerState {
  final String errorMessage;
  ScannerFailure({required this.errorMessage});
}

class ScannerSuccess extends ScannerState {
  final XceptionResponseModel xceptionResponseModel;
  ScannerSuccess({required this.xceptionResponseModel});
}

class SendDiagnosisSuccess extends ScannerState {
  final DiagnosisResponseModel diagnosisModel;
  SendDiagnosisSuccess({required this.diagnosisModel});
}

class ScannerLoading extends ScannerState {}

class FlashModestate extends ScannerState {}

class ImageSuccessState extends ScannerState {}
