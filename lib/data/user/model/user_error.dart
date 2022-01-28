import 'dart:convert';

UserError userErrorFromJson(String str) => UserError.fromJson(json.decode(str));

String userErrorToJson(UserError data) => json.encode(data.toJson());

class UserError {
  UserError({
    required this.code,
    this.message,
  });

  int code;
  String? message;

  factory UserError.fromJson(Map<String, dynamic> json) => UserError(
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
  };
}