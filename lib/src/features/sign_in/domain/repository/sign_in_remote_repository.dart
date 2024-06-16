import 'package:guider/src/features/sign_in/domain/entities/user.dart';

abstract class SignInRemoteRepository {
  Future<void> signIn(UserEntity user);
}
