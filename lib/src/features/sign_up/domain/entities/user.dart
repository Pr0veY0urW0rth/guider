// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    this.email,
    this.password,
    this.phone,
    this.username,
  });

  final String? email;
  final String? password;
  final String? phone;
  final String? username;

  @override
  List<Object?> get props => [email, password, phone, username];
}
