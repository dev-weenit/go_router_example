import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routingv2/stubs/api.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shops'),
      ),
      body: ListView.builder(
          itemCount: shops.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(shops.elementAt(index).name),
              onTap: () {
                // context.goNamed(
                //   'categories',
                //   pathParameters: {'shopId': shops.elementAt(index).id},
                // );

                context.go('/shops/${shops.elementAt(index).id}');
              },
            );
          }),
    );
  }
}
