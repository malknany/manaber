class Model {
  String? title;
  // String? image;

  Model(
    this.title,
    // this.image,
  );
}

List<Model> mainList = [
  Model(
    "kinani",
  ),
  Model(
    "ebrahim",
  ),
  Model(
    "hossam ",
  ),
  Model(
    "yousef",
  ),
  Model(
    "محمد الكناني",
  ),
];

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
    required this.weigthAtBirth,
    required this.vaccinations,
    required this.currentMedication,
    required this.cramps,
    required this.otherProblems,
    required this.sameProblemInFamily,
    required this.geneAnalysis,
    required this.geneProblem,
  });
  late final String id;
  late final String name;
  late final String gender;
  late final String phoneNumber;
  late final String createdById;
  late final String createdAt;
  late final String updatedAt;
  late final String department;
  late final String consanguinity;
  late final String pregnancyProblem;
  late final String weigthAtBirth;
  late final String vaccinations;
  late final String currentMedication;
  late final String cramps;
  late final String otherProblems;
  late final bool sameProblemInFamily;
  late final String geneAnalysis;
  late final String geneProblem;
  
  Patient.fromJson(Map<String, dynamic> json){
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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['gender'] = gender;
    _data['phoneNumber'] = phoneNumber;
    _data['createdById'] = createdById;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['department'] = department;
    _data['consanguinity'] = consanguinity;
    _data['pregnancyProblem'] = pregnancyProblem;
    _data['weigthAtBirth'] = weigthAtBirth;
    _data['vaccinations'] = vaccinations;
    _data['currentMedication'] = currentMedication;
    _data['cramps'] = cramps;
    _data['otherProblems'] = otherProblems;
    _data['sameProblemInFamily'] = sameProblemInFamily;
    _data['geneAnalysis'] = geneAnalysis;
    _data['geneProblem'] = geneProblem;
    return _data;
  }
}