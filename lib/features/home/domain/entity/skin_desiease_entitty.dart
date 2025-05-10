import '../../../../core/data/models/get_diagnosis_model.dart';

class SkinDesieaseEntitty {
  final String title, image;

  SkinDesieaseEntitty({required this.title, required this.image});
}

List<SkinDesieaseEntitty> getSkinDesieaseList = [
  SkinDesieaseEntitty(
    title: "Eczema",
    image:
        "assets/images/doctor-dermatologist-examines-patients-hand-with-royalty-free-image-1662056958.webp",
  ),
  SkinDesieaseEntitty(
    title: "Psoriasis",
    image:
        "assets/images/doctor-dermatologist-examines-patients-hand-with-royalty-free-image-1662056958.webp",
  ),
  SkinDesieaseEntitty(
    title: "Acne",
    image:
        "assets/images/doctor-dermatologist-examines-patients-hand-with-royalty-free-image-1662056958.webp",
  ),
  SkinDesieaseEntitty(
    title: "Vitiligo",
    image:
        "assets/images/doctor-dermatologist-examines-patients-hand-with-royalty-free-image-1662056958.webp",
  ),
  SkinDesieaseEntitty(
    title: "Rosacea",
    image:
        "assets/images/doctor-dermatologist-examines-patients-hand-with-royalty-free-image-1662056958.webp",
  ),
];
GetItemDiagnosisModel getDummydisease() {
  return GetItemDiagnosisModel(
    confidence: 80,
    diagnoseTime: "2023-01-01",
    diagnosisId: "123",
    diseaseExplanation: "This is a dummy explanation",
    diseaseHeatmap:
        "https://th.bing.com/th/id/OIP.6GmHa6XfRABadAzRHCyJDwHaEK?w=296&h=180&c=7&r=0&o=7&cb=iwp2&dpr=1.3&pid=1.7&rm=3",
    diseaseImage:
        "https://th.bing.com/th/id/OIP.6GmHa6XfRABadAzRHCyJDwHaEK?w=296&h=180&c=7&r=0&o=7&cb=iwp2&dpr=1.3&pid=1.7&rm=3",
    diseaseName: "Dummy Disease",
    userid: "123",
  );
}

List<GetItemDiagnosisModel> listOfDummydisease = [
  GetItemDiagnosisModel(),
  GetItemDiagnosisModel(),
  GetItemDiagnosisModel(),
  GetItemDiagnosisModel(),
  GetItemDiagnosisModel(),
  GetItemDiagnosisModel(),
  GetItemDiagnosisModel(),
  GetItemDiagnosisModel(),
];
