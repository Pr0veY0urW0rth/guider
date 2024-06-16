import 'package:guider/src/features/sign_in/data/models/user.dart';

abstract class SignInRemoteDatasource {
  Future<void> signIn(UserModel user);
}
