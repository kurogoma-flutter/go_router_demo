// π¦ Flutter imports:
import 'package:flutter/material.dart';

// π¦ Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// π Project imports:

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

  /// [hideBottomNavigationPageList]γ«ε«γΎγγε ΄εBNBγιθ‘¨η€Ίγ«γγ
  bool isHideBottomNavigation(String currentPath) {
    return hideBottomNavigationPageList.contains(currentPath);
  }
}
