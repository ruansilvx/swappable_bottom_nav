import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TabSwapController extends InheritedWidget {
  TabSwapController({
    super.key,
    required List<SwappableTab> tabs,
    required super.child,
  }) : _indexedTabs = <int, (int, SwappableTab)>{}{
    for(var i = 0; i < tabs.length; i++) {
      _indexedTabs[i] = (i, tabs[i]);
    }
  }

  static TabSwapController? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TabSwapController>();
  }

  static TabSwapController of(BuildContext context) {
    final element = maybeOf(context);
    assert(element != null, 'TabSwapController not found in context');
    return element!;
  }

  final Map<int, (int, SwappableTab)> _indexedTabs;

  List<SwappableTab> get currentTabConfiguration {
    return _indexedTabs.entries.map((e) => e.value.$2).toList();
  }

  @override
  bool updateShouldNotify(covariant TabSwapController oldWidget) {
    return _indexedTabs != oldWidget._indexedTabs;
  }
}

class SwappableTab {
  const SwappableTab({required this.tabRoute, required this.builder});

  final BottomNavigationBarItem Function(BuildContext context) builder;
  final StatefulShellBranch tabRoute;
}
