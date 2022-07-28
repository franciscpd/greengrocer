// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? fullName;
  String? email;
  String? cpf;
  String? phone;
  String? password;
  String? id;
  String? token;

  UserModel({
    this.fullName,
    this.email,
    this.cpf,
    this.phone,
    this.password,
    this.id,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
