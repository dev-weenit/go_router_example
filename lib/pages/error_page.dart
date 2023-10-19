import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  final String location;

  const ErrorPage({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Invalid Request:\n $location'),
            ElevatedButton(
                onPressed: () {
                  context.go('/shops');
                },
                child: const Text('Go to Shops'))
          ],
        ),
      ),
    );
  }
}
