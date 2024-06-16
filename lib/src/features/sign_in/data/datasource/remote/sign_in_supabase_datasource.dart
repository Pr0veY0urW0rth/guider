import 'package:guider/src/core/supabase/supabase_injection.dart';
import 'package:guider/src/features/sign_in/data/models/user.dart';
import 'package:guider/src/features/sign_in/data/sign_in_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInSupabaseDatasource implements SignInRemoteDatasource {
  @override
  Future<void> signIn(UserModel user) async {
    final supabase = sl.get<Supabase>().client.auth;
    try {
      await supabase.signInWithPassword(
          email: user.email!, password: user.password!);
      //UserCacheModel userModel = UserCacheModel(
      //  username: supabase.currentSession!.user.userMetadata.toString(),
      //  email: supabase.currentSession!.user.email!,
      //  phone: supabase.currentSession!.user.phone!,
      //  token: supabase.currentSession!.accessToken.toString(),
      //);
      //return userModel; // supabase.currentSession!.accessToken.toString();
    } catch (ex) {
      throw Exception('Failed to login with $ex');
    }
  }
}
