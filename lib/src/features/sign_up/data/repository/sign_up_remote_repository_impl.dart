// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:guider/src/features/sign_up/data/datasource/remote/sign_up_remote_datasource.dart';
import 'package:guider/src/features/sign_up/data/models/user.dart';
import 'package:guider/src/features/sign_up/domain/entities/user.dart';

import 'package:guider/src/features/sign_up/domain/repository/sign_up_remote_repository.dart';

class SignUpRemoteRepositoryImpl implements SignUpRemoteRepository {
  SignUpRemoteDatasource datasource;
  SignUpRemoteRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<void> signUp(UserEntity user) async {
    await datasource.signUp(UserModel.fromEntity(user));
  }
}
