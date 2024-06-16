import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:guider/src/core/supabase/supabase_injection.dart';
import 'package:guider/src/features/user_profile/domain/user_profile_domain.dart';
import 'package:guider/src/features/user_profile/presentation/providers/state/user_profile_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserProfileNotifier extends StateNotifier<UserProfileState> {
  UserProfileNotifier() : super(const UserProfileState());

  bool _validate({
    UsernameFormz? username,
    PhoneFormz? phone,
    EmailFormz? email,
  }) {
    return Formz.validate([
      username ?? state.username,
      phone ?? state.phone,
      email ?? state.email,
    ]);
  }

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

  void changeEditing() {
    if (state.isEditingEnabled) {
      final supabase = sl.get<Supabase>().client.auth;
      supabase.updateUser(UserAttributes(email: state.email.value, data: {
        "username": state.username.value,
        "phone": state.phone.value
      }));
    }
    state = state.copyWith(isEditingEnabled: !state.isEditingEnabled);
  }

  Future<void> initUser() async {
    if (state.email.value.isEmpty ||
        state.phone.value.isEmpty ||
        state.username.value.isEmpty) {
      final supabase = sl.get<Supabase>().client.auth;
      final email = EmailFormz.dirty(supabase.currentUser?.email ?? '');
      final phone =
          PhoneFormz.dirty(supabase.currentUser?.userMetadata?["phone"] ?? '');
      final username = UsernameFormz.dirty(
          supabase.currentUser?.userMetadata?["username"] ?? '');
      state = state.copyWith(email: email, phone: phone, username: username);
    }
  }
}

final userProfileNotifierProvider =
    StateNotifierProvider<UserProfileNotifier, UserProfileState>((ref) {
  return UserProfileNotifier();
});
