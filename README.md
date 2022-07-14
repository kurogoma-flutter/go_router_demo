# go_router_demo

GoRouterパッケージを使い常時表示されるBottom Navigationの実装

### パッケージ
https://pub.dev/packages/go_router

### 該当ドキュメント
https://gorouter.dev/navigator-builder


## Getting Started

```
$ git clone https://github.com/kurogoma-flutter/go_router_demo.git
$ cd go_router_demo
$ flutter pub get
$ flutter run
```

## 主要箇所

### route.dart
```dart
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
      .......
      .......
    ],
    // Navigatorに関係なく常時表示する場合に使える
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
```

### provider
雑ですが判定処理してます
```dart
final hideBottomNavigationProvider =
    ChangeNotifierProvider<HideBottomNavigation>(
  (ref) {
    return HideBottomNavigation();
  },
);

class HideBottomNavigation extends ChangeNotifier {
  HideBottomNavigation();
  
  // BottomNavigationを隠したいルート一覧
  static const List<String> hideBottomNavigationPageList = [
    '/bottomC/pageA',
    '/bottomC/pageB',
    '/bottomC/pageC',
  ];

  /// [hideBottomNavigationPageList]に含まれる場合BNBを非表示にする
  bool isHideBottomNavigation(String currentPath) {
    return hideBottomNavigationPageList.contains(currentPath);
  }
}
```
