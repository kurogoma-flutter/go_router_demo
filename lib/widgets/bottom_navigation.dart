import 'package:go_router_demo/providers/bottom_navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyBottomNavigation extends ConsumerStatefulWidget {
  const MyBottomNavigation({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends ConsumerState<MyBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.child,
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: ref.watch(bottomNavIndexProvider),
              onTap: (i) {
                ref.read(bottomNavIndexProvider.notifier).update((state) => i);

                // indexに応じてGoRouterのページに遷移
                switch (i) {
                  case 0:
                    context.go('/bottomA');
                    break;
                  case 1:
                    context.go('/bottomB');
                    break;
                  case 2:
                    context.go('/bottomC');
                    break;
                }
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_forward, color: Colors.grey),
                  label: 'BottomA',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.replay, color: Colors.grey),
                  label: 'BottomB',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.tab, color: Colors.grey),
                  label: 'BottomC',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
