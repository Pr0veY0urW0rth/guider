import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guider/src/features/user_profile/domain/user_profile_domain.dart';
import 'package:guider/src/features/user_profile/presentation/providers/state/user_profile_state.dart';

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
    state = state.copyWith(isEditingEnabled: !state.isEditingEnabled);
    print(state.isEditingEnabled);
  }
}

final userProfileNotifierProvider =
    StateNotifierProvider<UserProfileNotifier, UserProfileState>((ref) {
  return UserProfileNotifier();
});
