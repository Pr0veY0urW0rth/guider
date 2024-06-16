import 'package:guider/src/features/sign_up/data/datasource/remote/sign_up_remote_datasource.dart';
import 'package:guider/src/features/sign_up/data/datasource/remote/sign_up_supabase_datasource.dart';
import 'package:guider/src/features/sign_up/data/repository/sign_up_remote_repository_impl.dart';
import 'package:guider/src/features/sign_up/domain/repository/sign_up_remote_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_providers.g.dart';

@Riverpod(keepAlive: true)
SignUpRemoteDatasource signUpRemoteDatasource(SignUpRemoteDatasourceRef ref) {
  return SignUpSupabaseDatasource();
}

@Riverpod(keepAlive: true)
SignUpRemoteRepository signUpRemoteRepository(SignUpRemoteRepositoryRef ref) {
  return SignUpRemoteRepositoryImpl(
      datasource: ref.watch(signUpRemoteDatasourceProvider));
}
