import 'package:flutter/material.dart';
import 'package:guider/src/core/router/app_router.dart';
import 'package:guider/src/core/theme/app_theme.dart';

/// The Widget that configures your application.
class GuiderApp extends StatelessWidget {
  @override
  const GuiderApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme,
      routerConfig: GuiderNavigationHelper.router,
    );
  }
}
