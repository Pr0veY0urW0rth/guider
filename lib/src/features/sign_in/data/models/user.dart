import 'package:guider/src/features/sign_in/domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.email,
    super.password,
  });

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(email: user.email, password: user.password);
  }
}
