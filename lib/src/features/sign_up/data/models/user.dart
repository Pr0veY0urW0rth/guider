import 'package:guider/src/features/sign_up/domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.email,
    super.password,
    super.phone,
    super.username,
  });

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
        email: user.email,
        password: user.password,
        phone: user.phone,
        username: user.username);
  }
}
