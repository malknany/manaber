class ModelProfile {
  ModelProfile({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.role,
    required this.approved,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String name;
  late final String phoneNumber;
  late final String role;
  late final bool approved;
  late final String createdAt;
  late final String updatedAt;
  
  ModelProfile.fromJson(Map<String, dynamic> json){
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