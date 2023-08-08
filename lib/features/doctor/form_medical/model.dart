class ModelPatientInfo {
  int? questionId;
  int? id;
  String? question;
  String? type;
  List<String>? options;
  String? section;
  String? subsection;
  String? department;
  String? showSubSectionAs;
  String? answer;
  String? left;
  String? right;

  ModelPatientInfo(
      {this.questionId,
      this.id,
      this.question,
      this.type,
      this.options,
      this.section,
      this.subsection,
      this.department,
      this.showSubSectionAs,
      this.answer,
      this.left,
      this.right});

  ModelPatientInfo.fromJson(Map<String, dynamic> json) {
    questionId = json['questionId'];
    id = json['id'];
    question = json['question'];
    type = json['type'];
    if (json['options'] != null) {
      options = List<String>.from(json['options'].cast<String>());
    }
    section = json['section'];
    subsection = json['subsection'];
    department = json['department'];
    showSubSectionAs = json['showSubSectionAs'];
    answer = json['answer'];
    left = json['left'];
    right = json['right'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['questionId'] = questionId;
    data['id'] = id;
    data['question'] = question;
    data['type'] = type;
    data['options'] = options;
    data['section'] = section;
    data['subsection'] = subsection;
    data['department'] = department;
    data['showSubSectionAs'] = showSubSectionAs;
    data['answer'] = answer;
    data['left'] = left;
    data['right'] = right;
    return data;
  }
}
