

import 'dart:convert';

List<Photo> photoListModelFromJson(String str) =>
    List<Photo>.from(json.decode(str).map((x) => Photo.fromJson(x)));

String photoListModelToJson(List<Photo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Photo {
  int albumId;
  int id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Photo({
    required this.albumId,
    required this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });
  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    albumId: json["albumId"] ?? -1,
    id: json["id"] ?? -1,
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
