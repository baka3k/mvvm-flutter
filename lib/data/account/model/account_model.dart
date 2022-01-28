import 'dart:convert';

AccountModel accountModelFromJson(String str) => AccountModel.fromJson(json.decode(str));
String accountModelToJson(AccountModel data) => json.encode(data.toJson());

class AccountModel {
  AccountModel({
    required this.code,
    this.message,
  });

  int code;
  String? message;

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
  };
}