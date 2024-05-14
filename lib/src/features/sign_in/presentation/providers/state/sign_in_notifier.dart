import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:guider/src/features/sign_in/domain/sign_in_domain.dart';
import 'package:guider/src/features/sign_in/presentation/providers/state/sign_in_state.dart';

class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier() : super(const SignInState());

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

  bool _validate({EmailFormz? email, PasswordFormz? password}) {
    return Formz.validate([email ?? state.email, password ?? state.password]);
  }

  void changePasswordVisibility() {
    state = state.copyWith(isPasswordObscured: !state.isPasswordObscured);
  }

  Future<void> signIn() async {
    //todo : add repository
    //state = state.copyWith(status: SignInStatus.loading);

    //Future.delayed(const Duration(seconds: 5));

    state = state.copyWith(status: SignInStatus.success);
  }
}

final signInNotifierProvider =
    StateNotifierProvider<SignInNotifier, SignInState>(
        (ref) => SignInNotifier());
