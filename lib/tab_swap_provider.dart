import 'package:flutter/material.dart';
import 'package:swappable_bottom_nav/tab_swap_controller.dart';

class TabSwapProvider extends InheritedWidget {
  const TabSwapProvider({
    super.key,
    required this.tabSwapController,
    required super.child,
  });

  static TabSwapProvider? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TabSwapProvider>();
  }

  static TabSwapProvider of(BuildContext context) {
    final element = maybeOf(context);
    assert(element != null, 'TabSwapController not found in context');
    return element!;
  }

  final TabSwapController tabSwapController;

  @override
  bool updateShouldNotify(covariant TabSwapProvider oldWidget) {
    return this.tabSwapController != oldWidget.tabSwapController;
  }
}

extension TabSwapControllerContext on BuildContext {
  TabSwapController get tabController {
    return TabSwapProvider.of(this).tabSwapController;
  }
}
