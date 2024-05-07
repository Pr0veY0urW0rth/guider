import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:guider/src/features/sign_in/domain/validation/password_formz.dart';
import 'package:guider/src/features/sign_in/domain/validation/username_formz.dart';
import 'package:guider/src/features/sign_in/presentation/providers/sign_in_state.dart';

class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier() : super(const SignInState());

  void updateUsername(String value) {
    final username = UsernameFormz.dirty(value);
    final formIsValid = _validate(username: username);
    state = state.copyWith(username: username, formIsValid: formIsValid);
  }

  void updatePassword(String value) {
    final password = PasswordFormz.dirty(value);
    final formIsValid = _validate(password: password);
    state = state.copyWith(password: password, formIsValid: formIsValid);
  }

  bool _validate({UsernameFormz? username, PasswordFormz? password}) {
    return Formz.validate(
        [username ?? state.username, password ?? state.password]);
  }
}

final signInNotifierProvider =
    StateNotifierProvider<SignInNotifier, SignInState>(
        (ref) => SignInNotifier());
