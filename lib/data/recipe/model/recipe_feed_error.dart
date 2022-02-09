import 'dart:convert';
RecipeFeedError recipeFeedErrorFromJson(String str) => RecipeFeedError.fromJson(json.decode(str));
String recipeFeedErrorToJson(RecipeFeedError data) => json.encode(data.toJson());

class RecipeFeedError {
  RecipeFeedError({
    required this.code,
    this.message,
  });

  int code;
  String? message;

  factory RecipeFeedError.fromJson(Map<String, dynamic> json) => RecipeFeedError(
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
  };
}