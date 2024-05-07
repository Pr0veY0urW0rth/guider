import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:guider/src/features/sign_in/domain/validation/password_formz.dart';
import 'package:guider/src/features/sign_in/domain/validation/username_formz.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @Default(UsernameFormz.pure()) UsernameFormz username,
    @Default(PasswordFormz.pure()) PasswordFormz password,
    @Default(false) bool formIsValid,
    @Default(true) bool isPasswordObscured,
    @Default(SignInStatus.initial) SignInStatus status,
  }) = _SignInState;
}

enum SignInStatus { initial, sending, success, failure }
