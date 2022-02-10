import 'dart:convert';

List<RecipeFeedModel> recipeFeedModelFromJson(String str) =>
    List<RecipeFeedModel>.from(
        json.decode(str).map((x) => RecipeFeedModel.fromJson(x)));

String recipeFeedModelToJson(List<RecipeFeedModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecipeFeedModel {
  RecipeFeedModel({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  });

  String? id;
  String? author;
  int? width;
  int? height;
  String? url;
  String? downloadUrl;

  factory RecipeFeedModel.fromJson(Map<String, dynamic> json) =>
      RecipeFeedModel(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "width": width,
        "height": height,
        "url": url,
        "downloadUrl": downloadUrl,
      };
}
