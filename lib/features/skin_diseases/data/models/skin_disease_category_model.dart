class SkinDiseaseCategoryModel {
  List<Data>? data;

  SkinDiseaseCategoryModel({this.data});

  SkinDiseaseCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? diseaseDescription;
  String? diseaseHowtoavoid;
  String? diseaseImage;
  String? diseaseName;

  Data({
    this.sId,
    this.diseaseDescription,
    this.diseaseHowtoavoid,
    this.diseaseImage,
    this.diseaseName,
  });

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    diseaseDescription = json['disease_description'];
    diseaseHowtoavoid = json['disease_howtoavoid'];
    diseaseImage = json['disease_image'];
    diseaseName = json['disease_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['disease_description'] = this.diseaseDescription;
    data['disease_howtoavoid'] = this.diseaseHowtoavoid;
    data['disease_image'] = this.diseaseImage;
    data['disease_name'] = this.diseaseName;
    return data;
  }
}
