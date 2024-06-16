// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:guider/src/core/user_cache_service/data/datasource/storage_service_datasource.dart';

import 'package:guider/src/core/user_cache_service/domain/entities/user_cache_entity.dart';
import 'package:guider/src/core/user_cache_service/domain/repository/storage_service_repository.dart';

class StorageServiceRepositoryImpl extends StorageServiceRepository {
  StorageServiceDatasource datasource;
  StorageServiceRepositoryImpl(
    this.datasource,
  );

  @override
  Future<void> addPasswordForData(String password) async {
    await datasource.addPasswordForData(password);
  }

  @override
  Future<void> changeSupabaseOptionality() async {
    await datasource.changeSupabaseOptionality();
  }

  @override
  Future<bool> isUserLoggedIn() async {
    return await datasource.isUserLoggedIn();
  }

  @override
  Future<bool> isUsingPassword() async {
    return await datasource.isUsingPassword();
  }

  @override
  Future<bool> isUsingSupabase() async {
    return await datasource.isUsingSupabase();
  }

  @override
  Future<void> logOut() async {
    await datasource.logOut();
  }

  @override
  Future<void> removePasswordForData() async {
    await datasource.removePasswordForData();
  }

  @override
  Future<void> saveUser(UserCacheEntity user) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }
}
