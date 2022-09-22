// To parse this JSON data, do
//
//     final getMyInfoModel = getMyInfoModelFromJson(jsonString);

import 'dart:convert';

GetMyInfoModel getMyInfoModelFromJson(String str) =>
    GetMyInfoModel.fromJson(json.decode(str));

String getMyInfoModelToJson(GetMyInfoModel data) => json.encode(data.toJson());

class GetMyInfoModel {
  GetMyInfoModel({
    this.id,
    this.name,
    this.lastname,
    this.email,
    this.deviceId,
    this.typeAccount,
    this.password,
    this.emailVerificated,
    this.create,
    this.update,
  });

  String? id;
  String? name;
  String? lastname;
  String? email;
  String? deviceId;
  String? typeAccount;
  String? password;
  bool? emailVerificated;
  String? create;
  String? update;

  factory GetMyInfoModel.fromJson(Map<String, dynamic> json) => GetMyInfoModel(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        deviceId: json["deviceID"],
        typeAccount: json["type_account"],
        password: json["password"],
        emailVerificated: json["email_verificated"],
        create: json["create"],
        update: json["update"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "email": email,
        "deviceID": deviceId,
        "type_account": typeAccount,
        "password": password,
        "email_verificated": emailVerificated,
        "create": create,
        "update": update,
      };
}
