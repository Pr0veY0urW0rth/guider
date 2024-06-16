import 'package:guider/src/features/sign_in/data/repository/sign_in_remote_repository_impl.dart';
import 'package:guider/src/features/sign_in/data/sign_in_data.dart';
import 'package:guider/src/features/sign_in/domain/repository/sign_in_remote_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_providers.g.dart';

@Riverpod(keepAlive: true)
SignInRemoteDatasource signInRemoteDatasource(SignInRemoteDatasourceRef ref) {
  return SignInSupabaseDatasource();
}

@Riverpod(keepAlive: true)
SignInRemoteRepository signInRemoteRepository(SignInRemoteRepositoryRef ref) {
  return SignInRemoteRepositoryImpl(
      datasource: ref.watch(signInRemoteDatasourceProvider));
}
