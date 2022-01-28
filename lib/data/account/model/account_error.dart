import 'dart:convert';

AccountError accountErrorFromJson(String str) =>
    AccountError.fromJson(json.decode(str));

String accErrorToJson(AccountError data) => json.encode(data.toJson());

class AccountError {
  AccountError({
    required this.code,
    this.message,
  });

  int code;
  String? message;

  factory AccountError.fromJson(Map<String, dynamic> json) => AccountError(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
