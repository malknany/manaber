class ModelPatientInfo {
  int? questionId;
  int? id;
  String? question;
  String? type;
  String? section;
  String? subsection;
  String? department;
  String? answer;

  ModelPatientInfo(
      {this.questionId,
      this.id,
      this.question,
      this.type,
      this.section,
      this.subsection,
      this.department,
      this.answer});

  ModelPatientInfo.fromJson(Map<String, dynamic> json) {
    questionId = json['questionId'];
    id = json['id'];
    question = json['question'];
    type = json['type'];
    section = json['section'];
    subsection = json['subsection'];
    department = json['department'];
    answer = json['answer'];
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
    return data;
  }
}
