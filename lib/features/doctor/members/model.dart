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

// class Patient {
//   Patient({
//     required this.id,
//     required this.name,
//     required this.gender,
//     required this.phoneNumber,
//     required this.createdById,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.department,
//     required this.consanguinity,
//     required this.pregnancyProblem,
//     required this.weigthAtBirth,
//     required this.vaccinations,
//     required this.currentMedication,
//     required this.cramps,
//     required this.otherProblems,
//     required this.sameProblemInFamily,
//     required this.geneAnalysis,
//     required this.geneProblem,
//   });
//   late final String id;
//   late final String name;
//   late final String gender;
//   late final String phoneNumber;
//   late final String createdById;
//   late final String createdAt;
//   late final String updatedAt;
//   late final String department;
//   late final String consanguinity;
//   late final String pregnancyProblem;
//   late final String weigthAtBirth;
//   late final String vaccinations;
//   late final String currentMedication;
//   late final String cramps;
//   late final String otherProblems;
//   late final bool sameProblemInFamily;
//   late final String geneAnalysis;
//   late final String geneProblem;
  
//   Patient.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//     gender = json['gender'];
//     phoneNumber = json['phoneNumber'];
//     createdById = json['createdById'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     department = json['department'];
//     consanguinity = json['consanguinity'];
//     pregnancyProblem = json['pregnancyProblem'];
//     weigthAtBirth = json['weigthAtBirth'];
//     vaccinations = json['vaccinations'];
//     currentMedication = json['currentMedication'];
//     cramps = json['cramps'];
//     otherProblems = json['otherProblems'];
//     sameProblemInFamily = json['sameProblemInFamily'];
//     geneAnalysis = json['geneAnalysis'];
//     geneProblem = json['geneProblem'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['gender'] = gender;
//     _data['phoneNumber'] = phoneNumber;
//     _data['createdById'] = createdById;
//     _data['createdAt'] = createdAt;
//     _data['updatedAt'] = updatedAt;
//     _data['department'] = department;
//     _data['consanguinity'] = consanguinity;
//     _data['pregnancyProblem'] = pregnancyProblem;
//     _data['weigthAtBirth'] = weigthAtBirth;
//     _data['vaccinations'] = vaccinations;
//     _data['currentMedication'] = currentMedication;
//     _data['cramps'] = cramps;
//     _data['otherProblems'] = otherProblems;
//     _data['sameProblemInFamily'] = sameProblemInFamily;
//     _data['geneAnalysis'] = geneAnalysis;
//     _data['geneProblem'] = geneProblem;
//     return _data;
//   }
// }
class Patient {
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
  String? weigthAtBirth;
  String? vaccinations;
  String? currentMedication;
  String? cramps;
  String? otherProblems;
  bool? sameProblemInFamily;
  String? geneAnalysis;
  String? geneProblem;

  Patient(
      {this.id,
      this.name,
      this.gender,
      this.phoneNumber,
      this.createdById,
      this.createdAt,
      this.updatedAt,
      this.department,
      this.consanguinity,
      this.pregnancyProblem,
      this.weigthAtBirth,
      this.vaccinations,
      this.currentMedication,
      this.cramps,
      this.otherProblems,
      this.sameProblemInFamily,
      this.geneAnalysis,
      this.geneProblem});

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
    weigthAtBirth = json['weigthAtBirth'];
    vaccinations = json['vaccinations'];
    currentMedication = json['currentMedication'];
    cramps = json['cramps'];
    otherProblems = json['otherProblems'];
    sameProblemInFamily = json['sameProblemInFamily'];
    geneAnalysis = json['geneAnalysis'];
    geneProblem = json['geneProblem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['phoneNumber'] = this.phoneNumber;
    data['createdById'] = this.createdById;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['department'] = this.department;
    data['consanguinity'] = this.consanguinity;
    data['pregnancyProblem'] = this.pregnancyProblem;
    data['weigthAtBirth'] = this.weigthAtBirth;
    data['vaccinations'] = this.vaccinations;
    data['currentMedication'] = this.currentMedication;
    data['cramps'] = this.cramps;
    data['otherProblems'] = this.otherProblems;
    data['sameProblemInFamily'] = this.sameProblemInFamily;
    data['geneAnalysis'] = this.geneAnalysis;
    data['geneProblem'] = this.geneProblem;
    return data;
  }
}
