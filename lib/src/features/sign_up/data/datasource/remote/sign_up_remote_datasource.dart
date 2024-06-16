import 'package:guider/src/features/sign_up/data/models/user.dart';

abstract class SignUpRemoteDatasource {
  Future<void> signUp(UserModel user);
}
