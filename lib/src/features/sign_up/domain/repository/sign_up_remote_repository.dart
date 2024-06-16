import 'package:guider/src/features/sign_up/domain/entities/user.dart';

abstract class SignUpRemoteRepository {
  Future<void> signUp(UserEntity user);
}
