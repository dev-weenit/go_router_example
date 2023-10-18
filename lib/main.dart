import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:go_router/go_router.dart';
import 'package:routingv2/models/category.dart';
import 'package:routingv2/models/item.dart';
import 'package:routingv2/models/shop.dart';
import 'package:routingv2/router.dart';

const int maxShops = 2;
const int maxCategories = 2;

final shops = List.generate(
    maxShops, (index) => Shop(id: 'shop-$index', name: 'Shop $index'));

final categories = List.generate(maxCategories,
    (index) => Category(id: 'category-$index', name: 'Category $index'));

final items = List.generate(
    100,
    (index) => Item(
        id: index,
        name: 'Item $index',
        category: 'category-${Random().nextInt(maxCategories)}',
        shop: 'shop-${Random().nextInt(maxShops)}'));

class MainList {}

void main() {
  setUrlStrategy(PathUrlStrategy());
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
