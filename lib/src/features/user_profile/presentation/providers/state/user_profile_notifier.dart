import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guider/src/core/supabase/supabase_injection.dart';
import 'package:guider/src/features/user_profile/domain/user_profile_domain.dart';
import 'package:guider/src/features/user_profile/presentation/providers/state/user_profile_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserProfileNotifier extends StateNotifier<UserProfileState> {
  UserProfileNotifier() : super(const UserProfileState());
  void updateUsername(String value) {
    final username = UsernameFormz.dirty(value);
    state = state.copyWith(username: username);
  }

  void updatePhone(String value) {
    final phone = PhoneFormz.dirty(value);
    state = state.copyWith(phone: phone);
  }

  void updateEmail(String value) {
    final email = EmailFormz.dirty(value);
    state = state.copyWith(email: email);
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
