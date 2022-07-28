// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      cpf: json['cpf'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      id: json['id'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'cpf': instance.cpf,
      'phone': instance.phone,
      'password': instance.password,
      'id': instance.id,
      'token': instance.token,
    };
