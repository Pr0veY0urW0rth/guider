// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:guider/src/features/sign_up/domain/sign_up_domain.dart';

enum SignUpStatus { initial, loading, success, failure }

extension SignUpStatusX on SignUpStatus {
  bool get isInitial => this == SignUpStatus.initial;
  bool get isLoading => this == SignUpStatus.loading;
  bool get isSuccess => this == SignUpStatus.success;
  bool get isFailure => this == SignUpStatus.failure;
}

class SignUpState extends Equatable {
  const SignUpState({
    this.formIsValid = false,
    this.isPasswordObscured = true,
    this.isRepeatedPasswordObscured = true,
    this.password = const PasswordFormz.pure(),
    this.username = const UsernameFormz.pure(),
    this.email = const EmailFormz.pure(),
    this.phone = const PhoneFormz.pure(),
    this.repeatPassword = const RepeatPasswordFormz.pure(),
    this.status = SignUpStatus.initial,
  });

  final EmailFormz email;
  final bool formIsValid;
  final bool isPasswordObscured;
  final bool isRepeatedPasswordObscured;
  final PasswordFormz password;
  final PhoneFormz phone;
  final RepeatPasswordFormz repeatPassword;
  final SignUpStatus status;
  final UsernameFormz username;

  @override
  List<Object> get props {
    return [
      formIsValid,
      isPasswordObscured,
      isRepeatedPasswordObscured,
      password,
      username,
      email,
      phone,
      repeatPassword,
      status,
    ];
  }

  @override
  bool get stringify => true;

  SignUpState copyWith({
    bool? formIsValid,
    bool? isPasswordObscured,
    bool? isRepeatedPasswordObscured,
    PasswordFormz? password,
    UsernameFormz? username,
    EmailFormz? email,
    PhoneFormz? phone,
    RepeatPasswordFormz? repeatPassword,
    SignUpStatus? status,
  }) {
    return SignUpState(
      formIsValid: formIsValid ?? this.formIsValid,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      isRepeatedPasswordObscured:
          isRepeatedPasswordObscured ?? this.isRepeatedPasswordObscured,
      password: password ?? this.password,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      repeatPassword: repeatPassword ?? this.repeatPassword,
      status: status ?? this.status,
    );
  }
}
