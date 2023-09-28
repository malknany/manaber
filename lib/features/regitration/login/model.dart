class UsersModel {
  UsersModel({
    required this.token,
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.role,
    required this.approved,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String token;
  late final String id;
  late final String name;
  late final String phoneNumber;
  late final String role;
  late final bool approved;
  late final String createdAt;
  late final String updatedAt;
  
  UsersModel.fromJson(Map<String, dynamic> json){
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
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['id'] = id;
    _data['name'] = name;
    _data['phoneNumber'] = phoneNumber;
    _data['role'] = role;
    _data['approved'] = approved;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}