import 'package:guider/src/core/user_cache_service/domain/entities/user_cache_entity.dart';

abstract class StorageServiceRepository {
  Future<void> changeSupabaseOptionality();
  Future<void> addPasswordForData(String password);
  Future<void> removePasswordForData();
  Future<void> logOut();
  Future<bool> isUserLoggedIn();
  Future<bool> isUsingSupabase();
  Future<bool> isUsingPassword();
  Future<void> saveUser(UserCacheEntity user);
}
