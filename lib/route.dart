import 'package:go_router_demo/screens/additional_page.dart';
import 'package:go_router_demo/screens/error_screen.dart';
import 'package:go_router_demo/screens/login_screen.dart';
import 'package:go_router_demo/screens/number_screen.dart';
import 'package:go_router_demo/screens/bottom_b_page.dart';
import 'package:go_router_demo/screens/bottom_a_page.dart';
import 'package:go_router_demo/screens/bottom_c_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_demo/widgets/bottom_navigation.dart';
import 'package:go_router_demo/widgets/empty_bottom_navigation.dart';

// GoRouterクラスはRiverpodで依存注入
final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: '/bottomA',
    routes: <GoRoute>[
      GoRoute(
        name: 'bottomA',
        path: '/bottomA',
        // BottomNavigationBarでの画面遷移に見える様、遷移時のアニメーションを調整
        pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const BottomANavigationScreen(),
            transitionDuration: Duration.zero,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child),
        routes: [
          // サブルートへの画面遷移のサンプル
          GoRoute(
            name: 'login',
            path: 'login',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const LoginScreen(),
            ),
          ),
          // 引数を渡す画面遷移のサンプル
          GoRoute(
            name: 'number',
            path: 'number/:id',
            builder: (context, state) {
              final id = state.params['id']!;
              return NumberScreen(number: id);
            },
          ),
        ],
      ),
      GoRoute(
        name: 'bottomB',
        path: '/bottomB',
        // BottomNavigationBarでの画面遷移に見える様、遷移時のアニメーションを調整
        pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const BottomBNavigationScreen(),
            transitionDuration: Duration.zero,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child),
      ),
      GoRoute(
        name: 'bottomC',
        path: '/bottomC',
        routes: [
          GoRoute(
            name: 'pageA',
            path: 'page_a',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: PageA(key: state.pageKey),
            ),
          ),
          GoRoute(
            name: 'pageB',
            path: 'page_b',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: PageB(key: state.pageKey),
            ),
          ),
          GoRoute(
            name: 'pageC',
            path: 'page_c',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: PageC(key: state.pageKey),
            ),
          ),
        ],
        // BottomNavigationBarでの画面遷移に見える様、遷移時のアニメーションを調整
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const TabBarNavigationScreen(),
          transitionDuration: Duration.zero,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              child,
        ),
      ),
      GoRoute(
        name: 'additional',
        path: '/additional',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const AdditionalPage(),
        ),
      ),
    ],

    /// エラー画面
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: ErrorScreen(
        exception: state.error,
      ),
    ),
    navigatorBuilder: (context, state, child) {
      // GoRouterクラスの上に常に重なるNavigatorクラスを定義。
      // このNavigatorクラスにBottomNavigationBarを渡す事で永続化できる。
      const List<String> hideBottomNavigationPageList = [
        '/bottomC/page_c',
        '/additional',
      ];

      final hideBottomNavigation =
          hideBottomNavigationPageList.contains(state.location);

      if (hideBottomNavigation) {
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
  ),
);
