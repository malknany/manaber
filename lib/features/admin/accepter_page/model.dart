class ModelUserAccepteAndDelete {
  String? token;
  String? id;
  String? name;
  String? phoneNumber;
  String? role;
  bool? approved;
  String? createdAt;
  String? updatedAt;

  ModelUserAccepteAndDelete(
      {this.token,
      this.id,
      this.name,
      this.phoneNumber,
      this.role,
      this.approved,
      this.createdAt,
      this.updatedAt});

  ModelUserAccepteAndDelete.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    role = json['role'];
    approved = json['approved'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['id'] = id;
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['role'] = role;
    data['approved'] = approved;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

/*
 {
        "id": "-5Fn3NwsQIop7gVT8ktB1",
        "name": "kino",
        "phoneNumber": "1472583699",
        "role": "DOCTOR",
        "approved": false,
        "createdAt": "2023-07-20T06:10:58.999Z",
        "updatedAt": "2023-07-20T06:10:58.999Z"
    },
*/ 