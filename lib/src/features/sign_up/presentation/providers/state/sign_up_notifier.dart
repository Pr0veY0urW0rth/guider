import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:guider/src/features/sign_up/domain/entities/user.dart';
import 'package:guider/src/features/sign_up/domain/providers/sign_up_providers.dart';
import 'package:guider/src/features/sign_up/domain/repository/sign_up_remote_repository.dart';
import 'package:guider/src/features/sign_up/domain/sign_up_domain.dart';
import 'package:guider/src/features/sign_up/presentation/providers/state/sign_up_state.dart';

class SignUpNotifier extends StateNotifier<SignUpState> {
  final SignUpRemoteRepository remoteRepository;

  SignUpNotifier(this.remoteRepository) : super(const SignUpState());

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
    state = state.copyWith(status: SignUpStatus.loading);
    try {
      await remoteRepository.signUp(UserEntity(
          email: state.email.value,
          password: state.password.value,
          username: state.username.value,
          phone: state.phone.value));

      state = state.copyWith(status: SignUpStatus.success);
    } catch (ex) {
      state = state.copyWith(status: SignUpStatus.failure);
    }
  }
}

final signUpNotifierProvider =
    StateNotifierProvider<SignUpNotifier, SignUpState>(
        (ref) => SignUpNotifier(ref.watch(signUpRemoteRepositoryProvider)));
