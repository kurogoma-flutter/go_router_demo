import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_demo/providers/hide_bottom_navigation_provider.dart';
import 'package:go_router_demo/screens/bottom_navi_A/bottom_a_top.dart';
import 'package:go_router_demo/screens/bottom_navi_A/page_a.dart';
import 'package:go_router_demo/screens/bottom_navi_A/page_b.dart';
import 'package:go_router_demo/screens/bottom_navi_A/page_c.dart';
import 'package:go_router_demo/screens/bottom_navi_b/bottom_b_top.dart';
import 'package:go_router_demo/screens/bottom_navi_b/page_a.dart';
import 'package:go_router_demo/screens/bottom_navi_b/page_b.dart';
import 'package:go_router_demo/screens/bottom_navi_b/page_c.dart';
import 'package:go_router_demo/screens/bottom_navi_c/bottom_c_top.dart';
import 'package:go_router_demo/screens/bottom_navi_c/page_a.dart';
import 'package:go_router_demo/screens/bottom_navi_c/page_b.dart';
import 'package:go_router_demo/screens/bottom_navi_c/page_c.dart';
import 'package:go_router_demo/widgets/bottom_navigation.dart';
import 'package:go_router_demo/widgets/empty_bottom_navigation.dart';

// GoRouterクラスはRiverpodで依存注入
final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: '/bottomA',
    routes: <GoRoute>[
      GoRoute(
        path: '/bottomA',
        // BottomNavigationBarでの画面遷移に見える様、遷移時のアニメーションを調整
        pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const BottomNavigationTopA(),
            transitionDuration: Duration.zero,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child),
        routes: [
          GoRoute(
            path: 'pageA',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const BottomAPageA(),
            ),
          ),
          GoRoute(
            path: 'pageB',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const BottomAPageB(),
            ),
          ),
          GoRoute(
            path: 'pageC',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const BottomAPageC(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/bottomB',
        // BottomNavigationBarでの画面遷移に見える様、遷移時のアニメーションを調整
        pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const BottomNavigationTopB(),
            transitionDuration: Duration.zero,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child),
        routes: [
          GoRoute(
            path: 'pageA',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const BottomBPageA(),
            ),
          ),
          GoRoute(
            path: 'pageB',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const BottomBPageB(),
            ),
          ),
          GoRoute(
            path: 'pageC',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const BottomBPageC(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/bottomC',
        // BottomNavigationBarでの画面遷移に見える様、遷移時のアニメーションを調整
        pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const BottomNavigationTopC(),
            transitionDuration: Duration.zero,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child),
        routes: [
          GoRoute(
            path: 'pageA',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const BottomCPageA(),
            ),
          ),
          GoRoute(
            path: 'pageB',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const BottomCPageB(),
            ),
          ),
          GoRoute(
            path: 'pageC',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const BottomCPageC(),
            ),
          ),
        ],
      ),
    ],
    navigatorBuilder: (context, state, child) {
      /// Providerで判定処理
      if (ref
          .read(hideBottomNavigationProvider)
          .isHideBottomNavigation(state.location)) {
        return Navigator(
          onPopPage: (route, dynamic __) => false,
          pages: [
            MaterialPage<Widget>(
              child: EmptyBottomNavigation(
                child: child,
              ),
            ),
          ],
        );
      } else {
        return Navigator(
          onPopPage: (route, dynamic __) => false,
          pages: [
            MaterialPage<Widget>(
              child: MyBottomNavigation(
                child: child,
              ),
            ),
          ],
        );
      }
    },
  );
});
