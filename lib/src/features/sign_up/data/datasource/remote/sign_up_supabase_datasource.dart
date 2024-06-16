import 'package:guider/src/core/supabase/supabase_injection.dart';
import 'package:guider/src/features/sign_up/data/datasource/remote/sign_up_remote_datasource.dart';
import 'package:guider/src/features/sign_up/data/models/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpSupabaseDatasource implements SignUpRemoteDatasource {
  @override
  Future<void> signUp(UserModel user) async {
    final supabase = sl.get<Supabase>().client.auth;
    try {
      await supabase.signUp(
          email: user.email!,
          password: user.password!,
          phone: user.phone!,
          data: {
            "username": user.username!,
          });
    } catch (_) {
      return;
    }
  }
}
