class XceptionResponseModel {
  Explanation? explanation;
  Gradcam? gradcam;
  String? message;
  Prediction? prediction;
  QualityCheck? qualityCheck;

  XceptionResponseModel({
    this.explanation,
    this.gradcam,
    this.message,
    this.prediction,
    this.qualityCheck,
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
    qualityCheck =
        json['quality_check'] != null
            ? new QualityCheck.fromJson(json['quality_check'])
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
    if (this.qualityCheck != null) {
      data['quality_check'] = this.qualityCheck!.toJson();
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

class QualityCheck {
  Brightness? brightness;
  Distortion? distortion;
  Format? format;
  Brightness? noise;
  bool? overall;
  Resolution? resolution;
  Brightness? saturation;
  Brightness? sharpness;
  WhiteBalance? whiteBalance;

  QualityCheck({
    this.brightness,
    this.distortion,
    this.format,
    this.noise,
    this.overall,
    this.resolution,
    this.saturation,
    this.sharpness,
    this.whiteBalance,
  });

  QualityCheck.fromJson(Map<String, dynamic> json) {
    brightness =
        json['brightness'] != null
            ? new Brightness.fromJson(json['brightness'])
            : null;
    distortion =
        json['distortion'] != null
            ? new Distortion.fromJson(json['distortion'])
            : null;
    format =
        json['format'] != null ? new Format.fromJson(json['format']) : null;
    noise =
        json['noise'] != null ? new Brightness.fromJson(json['noise']) : null;
    overall = json['overall'];
    resolution =
        json['resolution'] != null
            ? new Resolution.fromJson(json['resolution'])
            : null;
    saturation =
        json['saturation'] != null
            ? new Brightness.fromJson(json['saturation'])
            : null;
    sharpness =
        json['sharpness'] != null
            ? new Brightness.fromJson(json['sharpness'])
            : null;
    whiteBalance =
        json['white_balance'] != null
            ? new WhiteBalance.fromJson(json['white_balance'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.brightness != null) {
      data['brightness'] = this.brightness!.toJson();
    }
    if (this.distortion != null) {
      data['distortion'] = this.distortion!.toJson();
    }
    if (this.format != null) {
      data['format'] = this.format!.toJson();
    }
    if (this.noise != null) {
      data['noise'] = this.noise!.toJson();
    }
    data['overall'] = this.overall;
    if (this.resolution != null) {
      data['resolution'] = this.resolution!.toJson();
    }
    if (this.saturation != null) {
      data['saturation'] = this.saturation!.toJson();
    }
    if (this.sharpness != null) {
      data['sharpness'] = this.sharpness!.toJson();
    }
    if (this.whiteBalance != null) {
      data['white_balance'] = this.whiteBalance!.toJson();
    }
    return data;
  }
}

class Brightness {
  bool? ok;
  double? value;

  Brightness({this.ok, this.value});

  Brightness.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ok'] = this.ok;
    data['value'] = this.value;
    return data;
  }
}

class Distortion {
  bool? ok;
  bool? value;

  Distortion({this.ok, this.value});

  Distortion.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ok'] = this.ok;
    data['value'] = this.value;
    return data;
  }
}

class Format {
  bool? ok;
  String? value;

  Format({this.ok, this.value});

  Format.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ok'] = this.ok;
    data['value'] = this.value;
    return data;
  }
}

class Resolution {
  bool? ok;
  List<int>? value;

  Resolution({this.ok, this.value});

  Resolution.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    value = json['value'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ok'] = this.ok;
    data['value'] = this.value;
    return data;
  }
}

class WhiteBalance {
  bool? ok;
  List<double>? value;

  WhiteBalance({this.ok, this.value});

  WhiteBalance.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    value = json['value'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ok'] = this.ok;
    data['value'] = this.value;
    return data;
  }
}
