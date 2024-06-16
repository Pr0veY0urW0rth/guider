import 'package:equatable/equatable.dart';

import 'package:guider/src/features/user_profile/domain/user_profile_domain.dart';

class UserProfileState extends Equatable {
  final UsernameFormz username;
  final EmailFormz email;
  final PhoneFormz phone;
  final bool isEditingEnabled;
  final bool formIsValid;
  const UserProfileState({
    this.username = const UsernameFormz.pure(),
    this.email = const EmailFormz.pure(),
    this.phone = const PhoneFormz.pure(),
    this.isEditingEnabled = false,
    this.formIsValid = true,
  });

  UserProfileState copyWith({
    UsernameFormz? username,
    EmailFormz? email,
    PhoneFormz? phone,
    bool? isEditingEnabled,
    bool? formIsValid,
  }) {
    return UserProfileState(
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      isEditingEnabled: isEditingEnabled ?? this.isEditingEnabled,
      formIsValid: formIsValid ?? this.formIsValid,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [username, email, phone, isEditingEnabled];
}
