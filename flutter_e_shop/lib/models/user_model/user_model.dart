import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_e_shop/models/product_model/product_model.dart';

UserModel userModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.image,
    required this.id,
    required this.name,
    required this.email,
  });

  String? image;
  String? name;
  String? id;
  String? email;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "email": email,
      };

    UserModel copyWith({
    String? name,image,
    }) => 
    UserModel(
        id: id,
        name: name??this.name,
        image: image??this.image,
        email: email,
    );
}