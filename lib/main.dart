import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guider/src/core/router/app_router.dart';
import 'package:guider/src/core/supabase/supabase_injection.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjections();
  GuiderNavigationHelper.instance;

  runApp(const ProviderScope(child: GuiderApp()));
}
