class ModelPatientInfo {
  int? questionId;
  int? id;
  String? question;
  String? type;
  String? section;
  String? subsection;
  String? department;
  String? answer;
  String? showSubSectionAs;
  String? left;
  String? right;

  ModelPatientInfo({
    this.questionId,
    this.id,
    this.question,
    this.type,
    this.section,
    this.subsection,
    this.department,
    this.answer,
    this.showSubSectionAs,
    this.left,
    this.right,
  });

  ModelPatientInfo.fromJson(Map<String, dynamic> json) {
    questionId = json['questionId'];
    id = json['id'];
    question = json['question'];
    type = json['type'];
    section = json['section'];
    subsection = json['subsection'];
    department = json['department'];
    answer = json['answer'];
    showSubSectionAs = json['showSubSectionAs'];
    left = json['left'];
    right = json['right'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['questionId'] = questionId;
    data['id'] = id;
    data['question'] = question;
    data['type'] = type;
    data['section'] = section;
    data['subsection'] = subsection;
    data['department'] = department;
    data['answer'] = answer;
    data['showSubSectionAs'] = showSubSectionAs;
    data['left'] = left;
    data['right'] = right;
    return data;
  }
}
