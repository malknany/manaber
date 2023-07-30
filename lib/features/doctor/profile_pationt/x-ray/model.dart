// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// class ModelXray {
//   final List<File> images;
//   ModelXray({
//     required this.images,
//   });
// }

ModelXray modelXrayFromJson(String str) => ModelXray.fromJson(json.decode(str));

String modelVideoToJson(ModelXray data) => json.encode(data.toJson());

class ModelXray {
  final String id;
  final List<String> urls;
  final String name;
  final String type;
  final String category;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String patientId;

  ModelXray({
    required this.id,
    required this.urls,
    required this.name,
    required this.type,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.patientId,
  });

  factory ModelXray.fromJson(Map<String, dynamic> json) => ModelXray(
        id: json["id"],
        urls: List<String>.from(json["urls"].map((x) => x)),
        name: json["name"],
        type: json["type"],
        category: json["category"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        patientId: json["patientId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "urls": List<dynamic>.from(urls.map((x) => x)),
        "name": name,
        "type": type,
        "category": category,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "patientId": patientId,
      };
}
