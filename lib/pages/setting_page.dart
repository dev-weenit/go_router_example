import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routingv2/stubs/api.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting Page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Setting Page'),
            ElevatedButton(
                onPressed: () => context.goNamed('order'),
                child: const Text('Go Order ')),
            ElevatedButton(
                onPressed: () => context.pushNamed('order'),
                child: const Text('Push Order ')),
            ElevatedButton(
                onPressed: () => context.goNamed(
                      'categories',
                      pathParameters: {'shopId': shops.first.id},
                    ),
                child: const Text('Go Order ')),
            ElevatedButton(
                onPressed: () => context.pushNamed(
                      'categories',
                      pathParameters: {'shopId': shops.first.id},
                    ),
                child: const Text('Push Order ')),
          ],
        ),
      ),
    );
  }
}
