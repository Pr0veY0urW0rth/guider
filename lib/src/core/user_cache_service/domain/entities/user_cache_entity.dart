// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:guider/src/core/user_cache_service/data/models/user_cache_model.dart';

class UserCacheEntity extends Equatable {
  const UserCacheEntity({
    required this.dataPassword,
    required this.email,
    required this.isUsingSupabase,
    required this.token,
    required this.isUsingPassword,
  });

  factory UserCacheEntity.fromModel(UserCacheModel user) {
    return UserCacheEntity(
        email: user.email,
        token: user.token,
        dataPassword: user.dataPassword,
        isUsingSupabase: user.isSavingInSupabase,
        isUsingPassword: user.isUsingPassword);
  }

  final String dataPassword;
  final String email;
  final bool isUsingSupabase;
  final String token;
  final bool isUsingPassword;

  UserCacheEntity copyWith({
    String? dataPassword,
    String? email,
    bool? isUsingSupabase,
    String? token,
    bool? isUsingPassword,
  }) {
    return UserCacheEntity(
      dataPassword: dataPassword ?? this.dataPassword,
      email: email ?? this.email,
      isUsingSupabase: isUsingSupabase ?? this.isUsingSupabase,
      token: token ?? this.token,
      isUsingPassword: isUsingPassword ?? this.isUsingPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dataPassword': dataPassword,
      'email': email,
      'isUsingSupabase': isUsingSupabase,
      'token': token,
      'isUsingPassword': isUsingPassword,
    };
  }

  factory UserCacheEntity.fromMap(Map<String, dynamic> map) {
    return UserCacheEntity(
      dataPassword: map['dataPassword'] as String,
      email: map['email'] as String,
      isUsingSupabase: map['isUsingSupabase'] as bool,
      token: map['token'] as String,
      isUsingPassword: map['isUsingPassword'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserCacheEntity.fromJson(String source) =>
      UserCacheEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      dataPassword,
      email,
      isUsingSupabase,
      token,
      isUsingPassword,
    ];
  }
}
