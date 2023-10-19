import 'package:go_router/go_router.dart';
import 'package:routingv2/pages/category_page.dart';
import 'package:routingv2/pages/error_page.dart';
import 'package:routingv2/pages/item_page.dart';
import 'package:routingv2/pages/shop_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/shops',
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
        path: '/error',
        name: 'error',
        builder: (context, state) {
          return ErrorPage(
            location: state.extra.toString().isEmpty
                ? state.uri.toString()
                : state.extra.toString(),
          );
        })
  ],
  errorBuilder: (context, state) => ErrorPage(
    location: state.uri.toString(),
  ),
);
