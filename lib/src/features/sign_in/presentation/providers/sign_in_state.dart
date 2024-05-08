import 'package:equatable/equatable.dart';
import 'package:guider/src/features/sign_in/domain/validation/password_formz.dart';
import 'package:guider/src/features/sign_in/domain/validation/username_formz.dart';

enum SignInStatus { initial, loading, success, failure }

extension SignInStatusX on SignInStatus {
  bool get isInitial => this == SignInStatus.initial;
  bool get isLoading => this == SignInStatus.loading;
  bool get isSuccess => this == SignInStatus.success;
  bool get isFailure => this == SignInStatus.failure;
}

class SignInState extends Equatable {
  const SignInState({
    this.username = const UsernameFormz.pure(),
    this.password = const PasswordFormz.pure(),
    this.formIsValid = false,
    this.isPasswordObscured = true,
    this.status = SignInStatus.initial,
  });

  final bool formIsValid;
  final bool isPasswordObscured;
  final PasswordFormz password;
  final SignInStatus status;
  final UsernameFormz username;

  @override
  List<Object?> get props => [
        username,
        password,
        formIsValid,
        isPasswordObscured,
        status,
      ];

  @override
  bool get stringify => true;

  SignInState copyWith({
    UsernameFormz? username,
    PasswordFormz? password,
    bool? formIsValid,
    bool? isPasswordObscured,
    SignInStatus? status,
  }) {
    return SignInState(
      username: username ?? this.username,
      password: password ?? this.password,
      formIsValid: formIsValid ?? this.formIsValid,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      status: status ?? this.status,
    );
  }
}
