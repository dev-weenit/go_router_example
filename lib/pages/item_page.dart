import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routingv2/stubs/api.dart';

class ItemPage extends StatelessWidget {
  final String shopId;
  final String categoryId;

  const ItemPage({super.key, required this.shopId, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final currentItems = items.where(
        (element) => element.category == categoryId && element.shop == shopId);

    if (currentItems.isEmpty) {
      context.goNamed('error', extra: GoRouterState.of(context).uri.toString());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${categories.where((element) => element.id == categoryId).first.name}Items count: ${currentItems.length}'),
      ),
      body: ListView.builder(
          itemCount: currentItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(currentItems.elementAt(index).name),
              onTap: () {
                // context.goNamed(
                //   'items',
                //   pathParameters: {
                //     'categoryId': categories.elementAt(index).id,
                //     'shopId': shopId
                //   },
                // );
              },
            );
          }),
    );
  }
}
