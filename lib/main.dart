import 'package:flutter/material.dart';
import 'package:routingv2/router.dart';

import 'stubs/url_strategy_stub.dart'
    if (dart.library.html) 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
