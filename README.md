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
```dart
final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: '/bottomA',
    routes: <GoRoute>[
      /// BottomNavigationのタブでグループを作成する
      GoRoute(
        name: 'bottomA',
        path: '/bottomA',
        pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const BottomANavigationScreen(), // 親ページ
            transitionDuration: Duration.zero,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child),
        /// BNB内部で遷移したいページ一覧を定義
        routes: [
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
    ],
    
    /// 画面に常時表示するウィジェットを定義できる
    navigatorBuilder: (context, state, child) {
      // BNBの非表示リスト
      const List<String> hideBottomNavigationPageList = [
        '/bottomC/page_c',
        '/additional',
      ];
      // 非表示判定
      final hideBottomNavigation =
          hideBottomNavigationPageList.contains(state.location);
      /// Navigator, MaterialPageを使ってViewを返す。
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
```
