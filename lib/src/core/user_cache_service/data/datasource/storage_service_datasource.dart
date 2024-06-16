abstract class StorageServiceDatasource {
  Future<void> changeSupabaseOptionality(); //
  Future<void> addPasswordForData(String password); //
  Future<void> removePasswordForData(); //
  Future<void> logOut(); //
  Future<bool> isUserLoggedIn(); //
  Future<bool> isUsingSupabase();
  Future<bool> isUsingPassword();
}
