// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserCacheModel {
  final String username;
  final String email;
  final String phone;
  final String token;
  UserCacheModel({
    required this.username,
    required this.email,
    required this.phone,
    required this.token,
  });

  UserCacheModel copyWith({
    String? username,
    String? email,
    String? phone,
    String? token,
  }) {
    return UserCacheModel(
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'phone': phone,
      'token': token,
    };
  }

  factory UserCacheModel.fromMap(Map<String, dynamic> map) {
    return UserCacheModel(
      username: map['username'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserCacheModel.fromJson(String source) =>
      UserCacheModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserCacheModel(username: $username, email: $email, phone: $phone, token: $token)';
  }

  @override
  bool operator ==(covariant UserCacheModel other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.email == email &&
        other.phone == phone &&
        other.token == token;
  }

  @override
  int get hashCode {
    return username.hashCode ^ email.hashCode ^ phone.hashCode ^ token.hashCode;
  }
}
