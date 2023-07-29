import 'dart:convert';

ModelVideo modelVideoFromJson(String str) =>
    ModelVideo.fromJson(json.decode(str));

String modelVideoToJson(ModelVideo data) => json.encode(data.toJson());

class ModelVideo {
  final String id;
  final String url;
  final String name;
  final String type;
  final String category;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String patientId;

  ModelVideo({
    required this.id,
    required this.url,
    required this.name,
    required this.type,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.patientId,
  });

  factory ModelVideo.fromJson(Map<String, dynamic> json) => ModelVideo(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        type: json["type"],
        category: json["category"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        patientId: json["patientId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "type": type,
        "category": category,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "patientId": patientId,
      };
}
