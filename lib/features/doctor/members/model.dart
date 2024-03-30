// class Model {
//   String? title;
//   // String? image;

//   Model(
//     this.title,
//     // this.image,
//   );
// }

// List<Model> mainList = [
//   Model(
//     "kinani",
//   ),
//   Model(
//     "ebrahim",
//   ),
//   Model(
//     "hossam ",
//   ),
//   Model(
//     "yousef",
//   ),
//   Model(
//     "محمد الكناني",
//   ),
// ];

class Patient {
  Patient({
    required this.id,
    required this.name,
    required this.gender,
    required this.phoneNumber,
    required this.createdById,
    required this.createdAt,
    required this.updatedAt,
    required this.department,
    required this.consanguinity,
    required this.pregnancyProblem,
    required this.weightAtBirth,
    required this.vaccinations,
    required this.currentMedication,
    required this.cramps,
    required this.otherProblems,
    required this.sameProblemInFamily,
    required this.geneAnalysis,
    required this.geneProblem,
  });
  String? id;
  String? name;
  String? gender;
  String? phoneNumber;
  String? createdById;
  String? createdAt;
  String? updatedAt;
  String? department;
  String? consanguinity;
  String? pregnancyProblem;
  String? weightAtBirth;
  String? vaccinations;
  String? currentMedication;
  String? cramps;
  String? otherProblems;
  bool? sameProblemInFamily;
  String? geneAnalysis;
  String? geneProblem;

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    phoneNumber = json['phoneNumber'];
    createdById = json['createdById'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    department = json['department'];
    consanguinity = json['consanguinity'];
    pregnancyProblem = json['pregnancyProblem'];
    weightAtBirth = json['weigthAtBirth'];
    vaccinations = json['vaccinations'];
    currentMedication = json['currentMedication'];
    cramps = json['cramps'];
    otherProblems = json['otherProblems'];
    sameProblemInFamily = json['sameProblemInFamily'];
    geneAnalysis = json['geneAnalysis'];
    geneProblem = json['geneProblem'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['gender'] = gender;
    data['phoneNumber'] = phoneNumber;
    data['createdById'] = createdById;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['department'] = department;
    data['consanguinity'] = consanguinity;
    data['pregnancyProblem'] = pregnancyProblem;
    data['weigthAtBirth'] = weightAtBirth;
    data['vaccinations'] = vaccinations;
    data['currentMedication'] = currentMedication;
    data['cramps'] = cramps;
    data['otherProblems'] = otherProblems;
    data['sameProblemInFamily'] = sameProblemInFamily;
    data['geneAnalysis'] = geneAnalysis;
    data['geneProblem'] = geneProblem;
    return data;
  }
}
