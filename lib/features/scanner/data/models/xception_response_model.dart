class XceptionResponseModel {
  Explanation? explanation;
  Gradcam? gradcam;
  String? message;
  Prediction? prediction;

  XceptionResponseModel({
    this.explanation,
    this.gradcam,
    this.message,
    this.prediction,
  });

  XceptionResponseModel.fromJson(Map<String, dynamic> json) {
    explanation =
        json['explanation'] != null
            ? new Explanation.fromJson(json['explanation'])
            : null;
    gradcam =
        json['gradcam'] != null ? new Gradcam.fromJson(json['gradcam']) : null;
    message = json['message'];
    prediction =
        json['prediction'] != null
            ? new Prediction.fromJson(json['prediction'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.explanation != null) {
      data['explanation'] = this.explanation!.toJson();
    }
    if (this.gradcam != null) {
      data['gradcam'] = this.gradcam!.toJson();
    }
    data['message'] = this.message;
    if (this.prediction != null) {
      data['prediction'] = this.prediction!.toJson();
    }
    return data;
  }
}

class Explanation {
  double? confidence;
  String? diseaseName;
  String? explanation;

  Explanation({this.confidence, this.diseaseName, this.explanation});

  Explanation.fromJson(Map<String, dynamic> json) {
    confidence = json['confidence'];
    diseaseName = json['disease_name'];
    explanation = json['explanation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confidence'] = this.confidence;
    data['disease_name'] = this.diseaseName;
    data['explanation'] = this.explanation;
    return data;
  }
}

class Gradcam {
  String? heatmap;

  Gradcam({this.heatmap});

  Gradcam.fromJson(Map<String, dynamic> json) {
    heatmap = json['heatmap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['heatmap'] = this.heatmap;
    return data;
  }
}

class Prediction {
  int? classId;
  String? className;
  double? confidence;

  Prediction({this.classId, this.className, this.confidence});

  Prediction.fromJson(Map<String, dynamic> json) {
    classId = json['class_id'];
    className = json['class_name'];
    confidence = json['confidence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['class_id'] = this.classId;
    data['class_name'] = this.className;
    data['confidence'] = this.confidence;
    return data;
  }
}
