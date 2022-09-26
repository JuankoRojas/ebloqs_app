// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.lastName,
    this.email,
    this.birthdayDate,
    this.typeAccount,
    this.deviceId,
    this.emailVerificated,
    this.password,
    this.idRef,
    this.status,
    this.verify,
    this.create,
    this.update,
    this.nationality,
    this.phone,
    this.dniNumber,
    this.zipCode,
    this.city,
    this.address,
    this.avatar,
  });

  String? id;
  String? name;
  String? lastName;
  String? email;
  String? birthdayDate;
  String? typeAccount;
  String? deviceId;
  bool? emailVerificated;
  String? password;
  String? idRef;
  bool? status;
  bool? verify;
  String? create;
  String? update;
  String? nationality;
  String? phone;
  String? dniNumber;
  String? zipCode;
  String? city;
  String? address;
  String? avatar;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        lastName: json["lastName"],
        email: json["email"],
        birthdayDate: json["birthdayDate"],
        typeAccount: json["typeAccount"],
        deviceId: json["deviceID"],
        emailVerificated: json["emailVerificated"],
        password: json["password"],
        idRef: json["idRef"],
        status: json["status"],
        verify: json["verify"],
        create: json["create"],
        update: json["update"],
        nationality: json["nationality"],
        phone: json["phone"],
        dniNumber: json["DniNumber"],
        zipCode: json["zipCode"],
        city: json["city"],
        address: json["address"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastName": lastName,
        "email": email,
        "birthdayDate": birthdayDate,
        "typeAccount": typeAccount,
        "deviceID": deviceId,
        "emailVerificated": emailVerificated,
        "password": password,
        "idRef": idRef,
        "status": status,
        "verify": verify,
        "create": create,
        "update": update,
        "nationality": nationality,
        "phone": phone,
        "DniNumber": dniNumber,
        "zipCode": zipCode,
        "city": city,
        "address": address,
        "avatar": avatar,
      };
}
