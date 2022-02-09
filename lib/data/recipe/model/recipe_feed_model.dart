import 'dart:convert';
RecipeFeedModel recipeFeedModelFromJson(String str) => RecipeFeedModel.fromJson(json.decode(str));
String recipeFeedModelToJson(RecipeFeedModel data) => json.encode(data.toJson());

class RecipeFeedModel {
  RecipeFeedModel({
    required this.code,
    this.message,
  });

  int code;
  String? message;

  factory RecipeFeedModel.fromJson(Map<String, dynamic> json) => RecipeFeedModel(
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
  };
}