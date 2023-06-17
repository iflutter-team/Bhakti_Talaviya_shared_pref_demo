import 'dart:convert';

List<PhotsModel> photsModelFromJson(String str) =>
    List<PhotsModel>.from(json.decode(str).map((x) => PhotsModel.fromJson(x)));

String photsModelToJson(List<PhotsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotsModel {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  PhotsModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory PhotsModel.fromJson(Map<String, dynamic> json) => PhotsModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
