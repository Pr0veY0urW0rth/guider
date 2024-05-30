import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:guider/src/core/router/app_router.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GuiderNavigationHelper.instance;
  runApp(const ProviderScope(child: GuiderApp()));
}
