class DiagnosisResponseModel {
  final String diagnosisId;
  final String message;
  final String? error;

  DiagnosisResponseModel({
    required this.diagnosisId,
    required this.message,
    this.error,
  });

  factory DiagnosisResponseModel.fromJson(Map<String, dynamic> json) {
    return DiagnosisResponseModel(
      diagnosisId: json['diagnosis_id'],
      message: json['message'],
      error: json['error'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'diagnosis_id': diagnosisId, 'message': message, 'error': error};
  }
}
