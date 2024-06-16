// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:guider/src/features/sign_in/data/models/user.dart';
import 'package:guider/src/features/sign_in/data/sign_in_data.dart';
import 'package:guider/src/features/sign_in/domain/entities/user.dart';
import 'package:guider/src/features/sign_in/domain/repository/sign_in_remote_repository.dart';

class SignInRemoteRepositoryImpl implements SignInRemoteRepository {
  SignInRemoteDatasource datasource;
  SignInRemoteRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<void> signIn(UserEntity user) async {
    await datasource.signIn(UserModel.fromEntity(user));
  }
}
