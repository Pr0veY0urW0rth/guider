// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:guider/src/core/user_cache_service/domain/entities/user_cache_entity.dart';
import 'package:hive/hive.dart';

// part 'user_cache_model.g.dart';

@HiveType(typeId: 1, adapterName: 'UserCacheModelAdapter')
class UserCacheModel extends HiveObject {
  UserCacheModel({
    required this.dataPassword,
    required this.email,
    required this.isSavingInSupabase,
    required this.token,
    required this.isUsingPassword,
  });

  factory UserCacheModel.fromEntity(UserCacheEntity user) {
    return UserCacheModel(
        email: user.email,
        token: user.token,
        dataPassword: user.dataPassword,
        isSavingInSupabase: user.isUsingSupabase,
        isUsingPassword: user.isUsingPassword);
  }

  factory UserCacheModel.fromJson(String source) =>
      UserCacheModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory UserCacheModel.fromMap(Map<String, dynamic> map) {
    return UserCacheModel(
      dataPassword: map['dataPassword'] as String,
      email: map['email'] as String,
      isSavingInSupabase: map['isSavingInSupabase'] as bool,
      token: map['token'] as String,
      isUsingPassword: map['isUsingPassword'] as bool,
    );
  }

  @HiveField(0)
  final String email;

  @HiveField(1)
  final String token;

  @HiveField(2)
  final String dataPassword;

  @HiveField(3)
  final bool isSavingInSupabase;

  @HiveField(4)
  final bool isUsingPassword;

  UserCacheModel copyWith({
    String? dataPassword,
    String? email,
    bool? isSavingInSupabase,
    String? token,
    bool? isUsingPassword,
  }) {
    return UserCacheModel(
      dataPassword: dataPassword ?? this.dataPassword,
      email: email ?? this.email,
      isSavingInSupabase: isSavingInSupabase ?? this.isSavingInSupabase,
      token: token ?? this.token,
      isUsingPassword: isUsingPassword ?? this.isUsingPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dataPassword': dataPassword,
      'email': email,
      'isSavingInSupabase': isSavingInSupabase,
      'token': token,
      'isUsingPassword': isUsingPassword,
    };
  }

  String toJson() => json.encode(toMap());
}
