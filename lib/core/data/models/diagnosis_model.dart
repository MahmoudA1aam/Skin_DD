class DiagnosisModel {
  final String userId;
  final String diseaseName;
  final String diseaseExplanation;
  final double confidence;
  final String diseaseImage;
  final String diseaseHeatmap;

  DiagnosisModel({
    required this.userId,
    required this.diseaseName,
    required this.diseaseExplanation,
    required this.confidence,
    required this.diseaseImage,
    required this.diseaseHeatmap,
  });

  factory DiagnosisModel.fromJson(Map<String, dynamic> json) {
    return DiagnosisModel(
      userId: json['userid'],
      diseaseName: json['disease_name'],
      diseaseExplanation: json['disease_explanation'],
      confidence: (json['confidence'] as num).toDouble(),
      diseaseImage: json['disease_image'],
      diseaseHeatmap: json['disease_heatmap'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userid': userId,
      'disease_name': diseaseName,
      'disease_explanation': diseaseExplanation,
      'confidence': confidence,
      'disease_image': diseaseImage,
      'disease_heatmap': diseaseHeatmap,
    };
  }
}
