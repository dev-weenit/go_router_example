import 'dart:math';

import 'package:routingv2/models/category.dart';
import 'package:routingv2/models/item.dart';
import 'package:routingv2/models/shop.dart';

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
