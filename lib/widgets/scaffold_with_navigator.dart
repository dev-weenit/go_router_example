import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavigator extends StatelessWidget {
  final Widget child;

  const ScaffoldWithNavigator({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shops'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              context.goNamed('shops');
              break;
            case 1:
              context.goNamed('settings');
              break;
          }
        },
        currentIndex:
            GoRouterState.of(context).uri.toString().contains('settings')
                ? 1
                : 0,
      ),
    );
  }
}
