import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:guider/src/features/sign_up/domain/sign_up_domain.dart';
import 'package:guider/src/features/sign_up/presentation/providers/state/sign_up_state.dart';

class SignUpNotifier extends StateNotifier<SignUpState> {
  SignUpNotifier() : super(const SignUpState());

  void updateUsername(String value) {
    final username = UsernameFormz.dirty(value);
    final formIsValid = _validate(username: username);
    state = state.copyWith(username: username, formIsValid: formIsValid);
  }

  void updatePhone(String value) {
    final phone = PhoneFormz.dirty(value);
    final formIsValid = _validate(phone: phone);
    state = state.copyWith(phone: phone, formIsValid: formIsValid);
  }

  void updateEmail(String value) {
    final email = EmailFormz.dirty(value);
    final formIsValid = _validate(email: email);
    state = state.copyWith(email: email, formIsValid: formIsValid);
  }

  void updatePassword(String value) {
    final password = PasswordFormz.dirty(value);
    final formIsValid = _validate(password: password);
    state = state.copyWith(password: password, formIsValid: formIsValid);
  }

  void updateRepeatPassword(String value) {
    final repeatPassword =
        RepeatPasswordFormz.dirty(password: state.password.value, value: value);
    final formIsValid = _validate(repeatPassword: repeatPassword);
    state = state.copyWith(
        repeatPassword: repeatPassword, formIsValid: formIsValid);
  }

  bool _validate({
    UsernameFormz? username,
    PhoneFormz? phone,
    EmailFormz? email,
    PasswordFormz? password,
    RepeatPasswordFormz? repeatPassword,
  }) {
    return Formz.validate([
      username ?? state.username,
      phone ?? state.phone,
      email ?? state.email,
      password ?? state.password,
      repeatPassword ?? state.repeatPassword
    ]);
  }

  void changePasswordVisibility() {
    state = state.copyWith(isPasswordObscured: !state.isPasswordObscured);
  }

  void changeRepeatPasswordVisibility() {
    state = state.copyWith(
        isRepeatedPasswordObscured: !state.isRepeatedPasswordObscured);
  }

  Future<void> signUp() async {
    //todo : add repository
    state = state.copyWith(status: SignUpStatus.loading);

    Future.delayed(const Duration(seconds: 5));

    state = state.copyWith(status: SignUpStatus.success);
  }
}

final signUpNotifierProvider =
    StateNotifierProvider<SignUpNotifier, SignUpState>(
        (ref) => SignUpNotifier());
