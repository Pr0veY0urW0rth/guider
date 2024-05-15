import 'package:equatable/equatable.dart';

import 'package:guider/src/features/user_profile/domain/user_profile_domain.dart';

class UserProfileState extends Equatable {
  final UsernameFormz username;
  final EmailFormz email;
  final PhoneFormz phone;
  final bool isEditingEnabled;
  const UserProfileState({
    this.username = const UsernameFormz.pure(),
    this.email = const EmailFormz.pure(),
    this.phone = const PhoneFormz.pure(),
    this.isEditingEnabled = false,
  });

  UserProfileState copyWith({
    UsernameFormz? username,
    EmailFormz? email,
    PhoneFormz? phone,
    bool? isEditingEnabled,
  }) {
    return UserProfileState(
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      isEditingEnabled: isEditingEnabled ?? this.isEditingEnabled,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [username, email, phone, isEditingEnabled];
}
