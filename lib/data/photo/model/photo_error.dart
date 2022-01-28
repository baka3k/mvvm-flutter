import 'dart:convert';

PhotoError userErrorFromJson(String str) => PhotoError.fromJson(json.decode(str));

String userErrorToJson(PhotoError data) => json.encode(data.toJson());

class PhotoError {
  PhotoError({
    required this.code,
    this.message,
  });

  int code;
  String? message;

  factory PhotoError.fromJson(Map<String, dynamic> json) => PhotoError(
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
  };
}