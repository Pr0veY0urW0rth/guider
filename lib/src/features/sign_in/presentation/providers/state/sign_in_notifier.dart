// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:guider/src/features/sign_in/domain/entities/user.dart';
import 'package:guider/src/features/sign_in/domain/providers/sign_in_providers.dart';

import 'package:guider/src/features/sign_in/domain/repository/sign_in_remote_repository.dart';
import 'package:guider/src/features/sign_in/domain/sign_in_domain.dart';
import 'package:guider/src/features/sign_in/presentation/providers/state/sign_in_state.dart';

class SignInNotifier extends StateNotifier<SignInState> {
  final SignInRemoteRepository remoteRepository;

  SignInNotifier(
    this.remoteRepository,
  ) : super(const SignInState());

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

  Future<SignInStatus> signIn() async {
    state = state.copyWith(status: SignInStatus.loading);
    try {
      await remoteRepository.signIn(
          UserEntity(email: state.email.value, password: state.password.value));

      state = state.copyWith(status: SignInStatus.success);
    } catch (ex) {
      print('Exception is $ex');
      state = state.copyWith(status: SignInStatus.failure);
    }

    return state.status;
  }
}

final signInNotifierProvider =
    StateNotifierProvider<SignInNotifier, SignInState>(
        (ref) => SignInNotifier(ref.watch(signInRemoteRepositoryProvider)));
