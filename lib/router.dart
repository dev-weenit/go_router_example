import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routingv2/pages/category_page.dart';
import 'package:routingv2/pages/error_page.dart';
import 'package:routingv2/pages/item_page.dart';
import 'package:routingv2/pages/order_page.dart';
import 'package:routingv2/pages/setting_page.dart';
import 'package:routingv2/pages/shop_page.dart';
import 'package:routingv2/widgets/scaffold_with_navigator.dart';

final GlobalKey<NavigatorState> parentNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: parentNavigatorKey,
  initialLocation: '/shops',
  routes: [
    ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          return ScaffoldWithNavigator(child: child);
        },
        routes: [
          GoRoute(
            path: '/shops',
            name: 'shops',
            builder: (context, state) {
              return const ShopPage();
            },
            routes: [
              GoRoute(
                path: ':shopId',
                name: 'categories',
                builder: (context, state) {
                  return CategoryPage(shopId: state.pathParameters['shopId']!);
                },
                routes: [
                  GoRoute(
                    parentNavigatorKey: parentNavigatorKey,
                    path: ':categoryId',
                    name: 'items',
                    builder: (context, state) {
                      return ItemPage(
                          shopId: state.pathParameters['shopId']!,
                          categoryId: state.pathParameters['categoryId']!);
                    },
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: '/settings',
            name: 'settings',
            builder: (context, state) {
              return const SettingPage();
            },
          ),
        ]),
    GoRoute(
      path: '/order',
      name: 'order',
      builder: (context, state) {
        return const OrderPage();
      },
    ),
    GoRoute(
      parentNavigatorKey: parentNavigatorKey,
      path: '/error',
      name: 'error',
      builder: (context, state) {
        return ErrorPage(
          location: state.extra.toString().isEmpty
              ? state.uri.toString()
              : state.extra.toString(),
        );
      },
    )
  ],
  errorBuilder: (context, state) => ErrorPage(
    location: state.uri.toString(),
  ),
);
