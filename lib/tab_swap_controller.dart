import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TabSwapController with ChangeNotifier {
  TabSwapController({
    required List<SwappableTab> tabs,
  }) : _indexedTabs = <int, (int, SwappableTab)>{} {
    for (var i = 0; i < tabs.length; i++) {
      _indexedTabs[i] = (i, tabs[i]);
    }
  }

  final Map<int, (int, SwappableTab)> _indexedTabs;

  List<SwappableTab> get currentTabConfiguration {
    return _indexedTabs.entries.map((e) => e.value.$2).toList();
  }
}

class SwappableTab {
  const SwappableTab({required this.tabRoute, required this.builder});

  final BottomNavigationBarItem Function(BuildContext context) builder;
  final StatefulShellBranch tabRoute;
}
