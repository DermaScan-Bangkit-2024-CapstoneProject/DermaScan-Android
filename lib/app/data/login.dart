import 'dart:convert';

import 'package:dermascan/app/data/user.dart';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  String message;
  User user;
  String token;

  Login({
    required this.message,
    required this.user,
    required this.token,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        message: json["message"],
        user: User.fromJson(json["data"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": user.toJson(),
        "token": token,
      };

  Map<String, dynamic> toMap() => toJson();
}
