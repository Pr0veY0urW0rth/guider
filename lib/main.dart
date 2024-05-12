import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yandex_maps_mapkit/init.dart' as init_mapkit;

import 'package:guider/src/core/router/app_router.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GuiderNavigationHelper.instance;
  await init_mapkit.initMapkit(apiKey: 'ee433e84-e80a-46da-981e-4c9d7d45b564');
  runApp(const ProviderScope(child: GuiderApp()));
}
