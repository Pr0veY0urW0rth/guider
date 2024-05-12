import 'package:equatable/equatable.dart';
import 'package:guider/src/features/sign_in/domain/sign_in_domain.dart';

enum SignInStatus { initial, loading, success, failure }

extension SignInStatusX on SignInStatus {
  bool get isInitial => this == SignInStatus.initial;
  bool get isLoading => this == SignInStatus.loading;
  bool get isSuccess => this == SignInStatus.success;
  bool get isFailure => this == SignInStatus.failure;
}

class SignInState extends Equatable {
  const SignInState({
    this.email = const EmailFormz.pure(),
    this.password = const PasswordFormz.pure(),
    this.formIsValid = false,
    this.isPasswordObscured = true,
    this.status = SignInStatus.initial,
  });

  final bool formIsValid;
  final bool isPasswordObscured;
  final PasswordFormz password;
  final SignInStatus status;
  final EmailFormz email;

  @override
  List<Object?> get props => [
        email,
        password,
        formIsValid,
        isPasswordObscured,
        status,
      ];

  @override
  bool get stringify => true;

  SignInState copyWith({
    EmailFormz? email,
    PasswordFormz? password,
    bool? formIsValid,
    bool? isPasswordObscured,
    SignInStatus? status,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      formIsValid: formIsValid ?? this.formIsValid,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      status: status ?? this.status,
    );
  }
}
