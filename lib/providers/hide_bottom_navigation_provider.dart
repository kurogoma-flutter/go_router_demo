// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 🌎 Project imports:

final hideBottomNavigationProvider =
    ChangeNotifierProvider<HideBottomNavigation>(
  (ref) {
    return HideBottomNavigation();
  },
);

class HideBottomNavigation extends ChangeNotifier {
  HideBottomNavigation();

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
