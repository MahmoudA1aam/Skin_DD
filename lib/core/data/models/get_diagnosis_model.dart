class GetDiagnosisModel {
  List<GetItemDiagnosisModel>? datas;

  GetDiagnosisModel({this.datas});

  GetDiagnosisModel.fromJson(Map<String, dynamic> json) {
    if (json['datas'] != null) {
      datas = <GetItemDiagnosisModel>[];
      json['datas'].forEach((v) {
        datas!.add(new GetItemDiagnosisModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.datas != null) {
      data['datas'] = this.datas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetItemDiagnosisModel {
  double? confidence;
  String? diagnoseTime;
  String? diagnosisId;
  String? diseaseExplanation;
  String? diseaseHeatmap;
  String? diseaseImage;
  String? diseaseName;
  String? userid;

  GetItemDiagnosisModel({
    this.confidence,
    this.diagnoseTime,
    this.diagnosisId,
    this.diseaseExplanation,
    this.diseaseHeatmap,
    this.diseaseImage,
    this.diseaseName,
    this.userid,
  });

  GetItemDiagnosisModel.fromJson(Map<String, dynamic> json) {
    confidence = json['confidence'];
    diagnoseTime = json['diagnose_time'];
    diagnosisId = json['diagnosis_id'];
    diseaseExplanation = json['disease_explanation'];
    diseaseHeatmap = json['disease_heatmap'];
    diseaseImage = json['disease_image'];
    diseaseName = json['disease_name'].toString();
    userid = json['userid'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confidence'] = this.confidence;
    data['diagnose_time'] = this.diagnoseTime;
    data['diagnosis_id'] = this.diagnosisId;
    data['disease_explanation'] = this.diseaseExplanation;
    data['disease_heatmap'] = this.diseaseHeatmap;
    data['disease_image'] = this.diseaseImage;
    data['disease_name'] = this.diseaseName;
    data['userid'] = this.userid;
    return data;
  }
}
