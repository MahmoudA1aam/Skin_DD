class DeleteDiagnosisModel {
  final String userid;

  DeleteDiagnosisModel({required this.userid});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userid'] = this.userid;

    return data;
  }
}

class DeleteDiagnosisResponseModel {
  String? message;
  DeleteDiagnosisResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
