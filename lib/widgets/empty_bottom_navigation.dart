import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmptyBottomNavigation extends ConsumerStatefulWidget {
  const EmptyBottomNavigation({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EmptyBottomNavigationState();
}

class _EmptyBottomNavigationState extends ConsumerState<EmptyBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
    );
  }
}
