import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routingv2/pages/error_page.dart';
import 'package:routingv2/stubs/api.dart';

class CategoryPage extends StatelessWidget {
  final String shopId;

  const CategoryPage({super.key, required this.shopId});

  @override
  Widget build(BuildContext context) {
    final currentShop = shops.where((element) => element.id == shopId);

    if (currentShop.isEmpty) {
      return const ErrorPage(location: 'CategoryPage');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(currentShop.first.name),
      ),
      body: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(categories.elementAt(index).name),
              onTap: () {
                // context.goNamed(
                //   'items',
                //   pathParameters: {
                //     'categoryId': categories.elementAt(index).id,
                //     'shopId': shopId
                //   },
                // );
                context.go('/shops/$shopId/${categories.elementAt(index).id}');
              },
            );
          }),
    );
  }
}
