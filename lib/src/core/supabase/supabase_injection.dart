import 'package:guider/src/core/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  await initSupabaseInjections();
}

initSupabaseInjections() async {
  final supabaseInstance = await Supabase.initialize(
      url: Constants.supabaseUrl, anonKey: Constants.supabaseKey);
  sl.registerSingleton(supabaseInstance);
}
